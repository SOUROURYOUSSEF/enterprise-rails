#sinclude 'symmetric-encryption'

module ActiveRecord
  module Validations

    class UniquenessValidator < ActiveModel::EachValidator # :nodoc:

      protected
        def build_relation(klass, table, attribute, value) #:nodoc:
          if reflection = klass._reflect_on_association(attribute)
            attribute = reflection.foreign_key
            value = value.attributes[reflection.klass.primary_key] unless value.nil?
          end

          attribute_name = attribute.to_s

          # change email to encrypted_email for symmetric_encryption. This is needed to override uniqueness validation
          # invoked by Devise gem on email attribute.
          if attribute_name == 'email'
            attribute_name = 'encrypted_email'
            attribute = :encrypted_email
          end

          # the attribute may be an aliased attribute
          if klass.attribute_aliases[attribute_name]
            attribute = klass.attribute_aliases[attribute_name]
            attribute_name = attribute.to_s
          end


          column = klass.columns_hash[attribute_name]
          value  = klass.connection.type_cast(value, column)
          if value.is_a?(String) && column.limit
            value = value.to_s[0, column.limit]
          end

          if attribute_name == 'encrypted_email'
            validate_unique_encrypted_email(klass, table, attribute, value)
          elsif !options[:case_sensitive] && value && column.text?
            # will use SQL LOWER function before comparison, unless it detects a case insensitive collation
            klass.connection.case_insensitive_comparison(table, attribute, column, value)
          else
            klass.connection.case_sensitive_comparison(table, attribute, column, value)
          end
        end

        def validate_unique_encrypted_email(klass, table, attribute, value)
          # code taken from active_record/connection_adapters/abstract_adapter.rb. Need to encrypt email address before comparing
          table_attr = table[attribute]
          value = klass.connection.case_sensitive_modifier(value, table_attr) unless value.nil?
          table_attr.eq(SymmetricEncryption.encrypt(value))
        end

    end

    module ClassMethods
      # Validates whether the value of the specified attributes are unique
      # across the system. Useful for making sure that only one user
      # can be named "davidhh".
      #
      #   class Person < ActiveRecord::Base
      #     validates_uniqueness_of :user_name
      #   end
      #
      # It can also validate whether the value of the specified attributes are
      # unique based on a <tt>:scope</tt> parameter:
      #
      #   class Person < ActiveRecord::Base
      #     validates_uniqueness_of :user_name, scope: :account_id
      #   end
      #
      # Or even multiple scope parameters. For example, making sure that a
      # teacher can only be on the schedule once per semester for a particular
      # class.
      #
      #   class TeacherSchedule < ActiveRecord::Base
      #     validates_uniqueness_of :teacher_id, scope: [:semester_id, :class_id]
      #   end
      #
      # It is also possible to limit the uniqueness constraint to a set of
      # records matching certain conditions. In this example archived articles
      # are not being taken into consideration when validating uniqueness
      # of the title attribute:
      #
      #   class Article < ActiveRecord::Base
      #     validates_uniqueness_of :title, conditions: -> { where.not(status: 'archived') }
      #   end
      #
      # When the record is created, a check is performed to make sure that no
      # record exists in the database with the given value for the specified
      # attribute (that maps to a column). When the record is updated,
      # the same check is made but disregarding the record itself.
      #
      # Configuration options:
      #
      # * <tt>:message</tt> - Specifies a custom error message (default is:
      #   "has already been taken").
      # * <tt>:scope</tt> - One or more columns by which to limit the scope of
      #   the uniqueness constraint.
      # * <tt>:conditions</tt> - Specify the conditions to be included as a
      #   <tt>WHERE</tt> SQL fragment to limit the uniqueness constraint lookup
      #   (e.g. <tt>conditions: -> { where(status: 'active') }</tt>).
      # * <tt>:case_sensitive</tt> - Looks for an exact match. Ignored by
      #   non-text columns (+true+ by default).
      # * <tt>:allow_nil</tt> - If set to +true+, skips this validation if the
      #   attribute is +nil+ (default is +false+).
      # * <tt>:allow_blank</tt> - If set to +true+, skips this validation if the
      #   attribute is blank (default is +false+).
      # * <tt>:if</tt> - Specifies a method, proc or string to call to determine
      #   if the validation should occur (e.g. <tt>if: :allow_validation</tt>,
      #   or <tt>if: Proc.new { |user| user.signup_step > 2 }</tt>). The method,
      #   proc or string should return or evaluate to a +true+ or +false+ value.
      # * <tt>:unless</tt> - Specifies a method, proc or string to call to
      #   determine if the validation should not occur (e.g. <tt>unless: :skip_validation</tt>,
      #   or <tt>unless: Proc.new { |user| user.signup_step <= 2 }</tt>). The
      #   method, proc or string should return or evaluate to a +true+ or +false+
      #   value.
      #
      # === Concurrency and integrity
      #
      # Using this validation method in conjunction with ActiveRecord::Base#save
      # does not guarantee the absence of duplicate record insertions, because
      # uniqueness checks on the application level are inherently prone to race
      # conditions. For example, suppose that two users try to post a Comment at
      # the same time, and a Comment's title must be unique. At the database-level,
      # the actions performed by these users could be interleaved in the following manner:
      #
      #               User 1                 |               User 2
      #  ------------------------------------+--------------------------------------
      #  # User 1 checks whether there's     |
      #  # already a comment with the title  |
      #  # 'My Post'. This is not the case.  |
      #  SELECT * FROM comments              |
      #  WHERE title = 'My Post'             |
      #                                      |
      #                                      | # User 2 does the same thing and also
      #                                      | # infers that their title is unique.
      #                                      | SELECT * FROM comments
      #                                      | WHERE title = 'My Post'
      #                                      |
      #  # User 1 inserts their comment.     |
      #  INSERT INTO comments                |
      #  (title, content) VALUES             |
      #  ('My Post', 'hi!')                  |
      #                                      |
      #                                      | # User 2 does the same thing.
      #                                      | INSERT INTO comments
      #                                      | (title, content) VALUES
      #                                      | ('My Post', 'hello!')
      #                                      |
      #                                      | # ^^^^^^
      #                                      | # Boom! We now have a duplicate
      #                                      | # title!
      #
      # This could even happen if you use transactions with the 'serializable'
      # isolation level. The best way to work around this problem is to add a unique
      # index to the database table using
      # ActiveRecord::ConnectionAdapters::SchemaStatements#add_index. In the
      # rare case that a race condition occurs, the database will guarantee
      # the field's uniqueness.
      #
      # When the database catches such a duplicate insertion,
      # ActiveRecord::Base#save will raise an ActiveRecord::StatementInvalid
      # exception. You can either choose to let this error propagate (which
      # will result in the default Rails exception page being shown), or you
      # can catch it and restart the transaction (e.g. by telling the user
      # that the title already exists, and asking them to re-enter the title).
      # This technique is also known as
      # {optimistic concurrency control}[http://en.wikipedia.org/wiki/Optimistic_concurrency_control].
      #
      # The bundled ActiveRecord::ConnectionAdapters distinguish unique index
      # constraint errors from other types of database errors by throwing an
      # ActiveRecord::RecordNotUnique exception. For other adapters you will
      # have to parse the (database-specific) exception message to detect such
      # a case.
      #
      # The following bundled adapters throw the ActiveRecord::RecordNotUnique exception:
      #
      # * ActiveRecord::ConnectionAdapters::MysqlAdapter.
      # * ActiveRecord::ConnectionAdapters::Mysql2Adapter.
      # * ActiveRecord::ConnectionAdapters::SQLite3Adapter.
      # * ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.
      def validates_uniqueness_of(*attr_names)
        attr_names.include?(:encrypted_email)
        # override UniquenessValidator with custom email validator for encrypted emails.
        validates_with UniquenessValidator, _merge_attributes(attr_names)
      end
    end
  end
end

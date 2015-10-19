# == Schema Information
#
# Table name: roles
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Role < ActiveRecord::Base

  validates_presence_of :name, :message => 'can not be empty'
#  validates_format_of :name, :with => /\A[a-z0-9_-]{4,25}\z/, :message => 'can not contain special characters'
  validates_length_of :name, :maximum => 256, :message => 'must be less than 256 chars'
  validates_length_of :description, :maximum => 256
  validates_uniqueness_of :name, :message => 'must be unique'


  has_many :permissions
  validates_associated :permissions

  has_and_belongs_to_many :users, -> { uniq }
  has_and_belongs_to_many :groups, -> { uniq }

  def permissions_for(class_name)
    appl_class = ApplicationClass.find_by(:name => class_name.camelize)
    ret = Set.new
    if appl_class == nil
      #raise exception
      return nil
    else
      perm_obj = permissions.where(:application_class_id => appl_class.id).first
      if perm_obj == nil
        #raise exception
        return nil
      else
        operations = appl_class.class_operations
        bits = perm_obj.permissions_mask
        bit_length = bits.size * 8
        bit_length.times do |i|
          ret.add(operations[i].to_sym) if bits[i] == 1
        end

      end

    end

    ret.to_a

  end

end


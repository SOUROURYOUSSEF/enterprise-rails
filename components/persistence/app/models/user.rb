# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  first_name         :string
#  last_name          :string
#  username           :string
#  email              :string
#  title              :string
#  department         :string
#  notes              :text
#  password_digest    :string
#  admin              :boolean          default(FALSE)
#  deleted_at         :datetime
#  image_file_path    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  password_salt      :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class User  < ActiveRecord::Base
  include AASM

  # See Authentcation
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable

  attr_encrypted :email
  attr_encrypted :home_phone
  attr_encrypted :mobile_phone

  validates_presence_of :username, :first_name, :last_name
  validates_presence_of :email, :symmetric_encryption => true

  validates :encrypted_email, :symmetric_encryption => true, :uniqueness => false

  validates_uniqueness_of :username, :case_sensitive => false, :allow_blank => false, :message => 'has already been taken'

  # validates_uniqueness_of :email, :case_sensitive => false, :allow_blank => false, :message => 'address has already been taken'

  validates_format_of :email,  :symmetric_encryption => true, :with => /[\w\.-]+(\+[\w-]*)?@([\w-]+\.)+[\w-]+/, :message => 'address is invalid'

  # validates_format_of :username, :with => validate_username
  validate :validate_username, :on => :create

  validates_format_of :home_phone, :symmetric_encryption => true, length: { in: 10 },
                      :with => /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/,
                      :allow_blank => true, :message => 'is invalid'
  validates_format_of :mobile_phone, :symmetric_encryption => true, length: { in: 10 },
                      :with => /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/,
                      :allow_blank => true, :message => 'is invalid'

  validates_length_of :username, :maximum => 25, :minimum => 8
  validates_length_of :first_name, :last_name, :title, :department, :maximum => 256
  validates_length_of :notes, :maximum => 4096


  # NOTE: Following is moved to authorization/lib/authrization.rb module. This
  # keeps allows seperation of concerns across components

  #has_and_belongs_to_many :groups, -> { uniq }
  #has_and_belongs_to_many :roles, -> { uniq }
  #has_many :application_objects

  def validate_username
    return true
  end

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  # NOTE: Following is moved to search/lib/search.rb module. This
  # keeps allows seperation of concerns across components

  # searchable do
  #    text :first_name
  #    text :last_name
  #    text :email
  #
  #    text :groups do
  #      groups.map {|group| group.name}
  #    end
  # end

end


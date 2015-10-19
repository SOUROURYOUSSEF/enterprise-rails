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

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :username, :first_name, :last_name, :email
  validates_uniqueness_of :username, :case_sensitive => false, :allow_blank => false, :message => 'has already been taken'
  validates_uniqueness_of :email, :case_sensitive => false, :allow_blank => false, :message => 'address has already been taken'
  validates_format_of :email, :with => /[\w\.-]+(\+[\w-]*)?@([\w-]+\.)+[\w-]+/, :message => 'address is invalid'
  validates_format_of :username, :with => /\A[a-z0-9_-]{8,25}\z/
  validates_length_of :username, :maximum => 25, :minimum => 8
  validates_length_of :first_name, :last_name, :email, :title, :department, :maximum => 256
  validates_length_of :notes, :maximum => 4096

  has_and_belongs_to_many :groups, -> { uniq }
  has_and_belongs_to_many :roles, -> { uniq }
  has_many :application_objects

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end

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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name 'John'
    last_name 'Doe'
    username 'johndoe_2'
    sequence(:email) {|n| "johndoe#{n}@gmail.com" }
  end
end

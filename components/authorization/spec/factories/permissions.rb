# == Schema Information
#
# Table name: permissions
#
#  id                   :integer          not null, primary key
#  permissions_mask     :integer          not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  role_id              :integer
#  application_class_id :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :permission do
    permissions_mask {Faker::Number.number(6)}
    #application_class_id FactoryGirl.build(:application_class).id
    #association :role
  end
end

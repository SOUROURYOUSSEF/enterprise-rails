# == Schema Information
#
# Table name: application_classes
#
#  id                :integer          not null, primary key
#  name              :string           not null
#  description       :string
#  parent_class_id   :integer
#  parent_class_name :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :application_class do
  end
end

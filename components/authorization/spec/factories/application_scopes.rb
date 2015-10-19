# == Schema Information
#
# Table name: application_scopes
#
#  id                :integer          not null, primary key
#  name              :string           not null
#  parent_class_id   :integer
#  parent_class_name :string
#  description       :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  group_id          :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :application_scope do
  end
end

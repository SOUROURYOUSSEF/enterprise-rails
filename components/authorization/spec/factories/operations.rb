# == Schema Information
#
# Table name: operations
#
#  id                   :integer          not null, primary key
#  name                 :string           not null
#  description          :text
#  sequence             :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  application_class_id :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :operation do
  end
end

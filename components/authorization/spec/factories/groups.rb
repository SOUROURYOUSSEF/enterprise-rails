# == Schema Information
#
# Table name: groups
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group do
    name {Faker::Lorem.characters(15)}
    description {Faker::Lorem.sentence}

    factory :group_with_3_users do
      after(:create) do |group|
         [:user_101, :user_201, :user_301].each do |user_name|
           group.users << FactoryGirl.build(:user, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: user_name, email: Faker::Internet.email)
         end
      end
    end
  end
end

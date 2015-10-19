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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :role do
    name {Faker::Lorem.characters(15)}
    description {Faker::Lorem.sentence}

    factory :user_role do
      after(:create) do |user_role|
        [:user_101, :user_201, :user_301].each do |user_name|
          user_role.users << FactoryGirl.build(:user, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: user_name, email: Faker::Internet.email)
        end
      end
    end

    factory :group_role do
      after(:create) do |group_role|
        [:group_101, :group_201, :group_301].each do |group_name|
          group_role.groups << FactoryGirl.build(:group, name: group_name)
        end
      end
    end

  end

end

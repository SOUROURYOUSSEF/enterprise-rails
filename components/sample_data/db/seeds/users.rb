# require 'factory_girl'
# require 'faker'

puts 'Add 1000 dummy user'

# NOTE: Add paths to factories defined in other engines. See engine.rb.

# FactoryGirl.definition_file_paths << File.expand_path("#{::Rails.root}/components/authorization/spec/factories", __FILE__)
# FactoryGirl.find_definitions

(1..10).each do |i|
  FactoryGirl.create(:user, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Lorem.characters(10), email: Faker::Internet.email, password:Faker::Internet.password(10))
end

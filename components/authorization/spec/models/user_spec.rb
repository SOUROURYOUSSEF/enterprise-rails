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

require 'rails_helper'
require 'shoulda-matchers'

RSpec.describe User do

  it 'has a valid factory' do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it 'is valid with first name, last_name, email and username' do
    expect(FactoryGirl.build(:user)).to be_valid
  end
  it 'is invalid without a username' do
    expect(FactoryGirl.build(:user, username: nil)).not_to be_valid
  end
  it 'is invalid without first name' do
    expect(FactoryGirl.build(:user, first_name: nil)).not_to be_valid
  end
  it 'is invalid without last name' do
    expect(FactoryGirl.build(:user, last_name: nil)).not_to be_valid
  end
  it 'is invalid without email' do
    expect(FactoryGirl.build(:user, email: nil)).not_to be_valid
  end

  it 'does not allow invalid email address' do
    expect(FactoryGirl.build(:user, email: 'johndoe#gmail.com')).not_to be_valid
  end

  it 'does not allow duplicate email addresses' do
    FactoryGirl.create(:user, email: 'prakash_teli@gmail.com')
    expect(FactoryGirl.build(:user, username: 'prakash_teli@gmail.com')).not_to be_valid
  end

  it 'does not allow duplicate user name' do
    FactoryGirl.create(:user, username: 'prakash_teli')
    expect(FactoryGirl.build(:user, username: 'prakash_teli')).not_to be_valid
  end

  it 'allows digits  _ and - in username' do
    expect(FactoryGirl.create(:user, username: 'john_doe-100')).to be_valid
  end
  it 'does not allow name with special chars' do
    expect(FactoryGirl.build(:user, username: 'pra%kash@)!@#')).not_to be_valid
  end

  it 'does not allow special chars in user name' do
    expect(FactoryGirl.build(:user, username: 'john$$doe')).not_to be_valid
  end

  it 'does not allow password less than 8 chars long' do
    expect(FactoryGirl.build(:user, username: 'johndoe')).not_to be_valid
  end

  it 'does not allow username longer than 25 chars' do
    expect(FactoryGirl.build(:user, username: Faker::Lorem.characters(30))).not_to be_valid
  end

  it 'does not allow duplicate email address' do
    FactoryGirl.create(:user, email: 'user_004@gmail.com')
    expect(FactoryGirl.build(:user, email:  'user_004@gmail.com')).not_to be_valid
  end

  it 'does not allow duplicate user name' do
    FactoryGirl.create(:user, username: 'user_004')
    expect(FactoryGirl.build(:user, username: 'user_004')).not_to be_valid
  end

  it 'does not allow title longer than 255 chars' do
    expect(FactoryGirl.build(:user, title: Faker::Lorem.sentence(300))).not_to be_valid
  end

  it 'does not allow notes longer than 4096 chars' do
    expect(FactoryGirl.build(:user, title: Faker::Lorem.characters(5200))).not_to be_valid
  end

  # not working
  describe User do
    it {should have_and_belongs_to_many(:groups)}
  end

end

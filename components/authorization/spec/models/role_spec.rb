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

require 'rails_helper'

RSpec.describe Role do

  it 'is invalid without name' do
    expect(FactoryGirl.build(:user_role, name: nil)).not_to be_valid
  end

  it 'is valid without description' do
    expect(FactoryGirl.build(:user_role, description: nil)).to be_valid
  end

  it 'does not allow names longer than 25 chars' do
    expect(FactoryGirl.build(:role, name: 'dffkdfkfffdkfkdjkjfkdjkffkkfjkfejrjkfkdfkelrkelkfkkejlrekfkd')).not_to be_valid
  end
  it 'allows digits  _ and - in username' do
    expect(FactoryGirl.create(:role, name: 'john_doe-100')).to be_valid
  end
  it 'does not allow name with special chars' do
    expect(FactoryGirl.build(:role, name: 'pra%kash@)!@#')).not_to be_valid
  end

  it 'does not allow duplicate names' do
    FactoryGirl.create(:role, name: 'duplicate_group')
    expect(FactoryGirl.build(:role, name: 'duplicate_group')).not_to be_valid
  end

  it 'does not allow description longer than 256 chars' do
    expect(FactoryGirl.build(:role, description: Faker::Lorem.characters(300))).not_to be_valid
  end

  it 'should have many users' do
    expect(FactoryGirl.create(:user_role).users.count).to eq 3
  end

  it 'should have many groups' do
    expect(FactoryGirl.create(:group_role).groups.count).to eq 3
  end

  # let(:role)  { FactoryGirl.create(:role) }
  #
  # it 'has and belongs to many users' do
  #   expect(role).to have_and_belongs_to_many(:users)
  # end

  # not working
  describe(:user_role) do
    it {should have_and_belongs_to_many(:users)}
  end

  describe(:group_role) do
    it {should have_and_belongs_to_many(:groups)}
  end

end

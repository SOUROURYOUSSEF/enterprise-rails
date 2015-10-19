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

require 'rails_helper'
#include Shoulda::Matchers

RSpec.describe Permission, :type => :model do

  it 'should belong to role' do
    should belong_to(:role)
  end

  it 'should belong to application_class' do
    should belong_to(:application_class)
  end

  it 'does not allow duplicate role id within scope of application class' do
    permission_1 = FactoryGirl.create(:permission, application_class_id: 12345)
    role = FactoryGirl.create(:role)
    role.permissions << permission_1
    permission_1.role = role
    permission_1.save!
    expect(FactoryGirl.build(:permission, application_class_id: 12345, role_id: role.id)).not_to be_valid
  end

end

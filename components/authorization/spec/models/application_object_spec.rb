# == Schema Information
#
# Table name: application_objects
#
#  id                   :integer          not null, primary key
#  instance_id          :integer          not null
#  parent_class_id      :integer
#  parent_class_name    :string
#  permissions_mask     :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  application_scope_id :integer
#  application_class_id :integer
#  user_id              :integer
#

require 'rails_helper'

RSpec.describe ApplicationObject, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

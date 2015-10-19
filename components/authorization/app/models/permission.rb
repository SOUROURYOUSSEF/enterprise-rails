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

class Permission < ActiveRecord::Base

  validates_uniqueness_of :role_id, :scope => :application_class_id

  belongs_to :role
  belongs_to :application_class

end

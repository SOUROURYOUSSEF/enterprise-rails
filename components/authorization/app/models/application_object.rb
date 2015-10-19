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

class ApplicationObject < ActiveRecord::Base

  validates_presence_of name
  validates_format_of   name, :with => /\A[a-z0-9_-]\z/
  validates_length_of   name, :maximum => 256

  belongs_to :user
  belongs_to :application_scope
  belongs_to :application_class

end

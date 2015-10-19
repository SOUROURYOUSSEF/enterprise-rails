# == Schema Information
#
# Table name: application_scopes
#
#  id                :integer          not null, primary key
#  name              :string           not null
#  parent_class_id   :integer
#  parent_class_name :string
#  description       :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  group_id          :integer
#

class ApplicationScope < ActiveRecord::Base

  validates_presence_of :name, :message => 'scope name can not be empty'
  #validates_format_of   :name, :with => /\A[a-z0-9_-]\z/
  validates_length_of   :name, :maximum => 256

  belongs_to :group
  has_many   :application_objects

end

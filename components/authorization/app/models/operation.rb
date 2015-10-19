# == Schema Information
#
# Table name: operations
#
#  id                   :integer          not null, primary key
#  name                 :string           not null
#  description          :text
#  sequence             :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  application_class_id :integer
#

class Operation < ActiveRecord::Base

  belongs_to :application_class
end

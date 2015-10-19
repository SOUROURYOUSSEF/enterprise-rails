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

require 'rails_helper'

RSpec.describe Operation, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

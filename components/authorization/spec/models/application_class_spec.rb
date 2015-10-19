# == Schema Information
#
# Table name: application_classes
#
#  id                :integer          not null, primary key
#  name              :string           not null
#  description       :string
#  parent_class_id   :integer
#  parent_class_name :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'rails_helper'

RSpec.describe ApplicationClass, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

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

require 'rails_helper'

RSpec.describe ApplicationScope, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

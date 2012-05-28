# == Schema Information
#
# Table name: nodes
#
#  id           :integer         not null, primary key
#  slug         :string(255)
#  name         :string(255)
#  status       :string(255)
#  section_id   :integer
#  description  :text
#  postion_at   :integer         default(0), not null
#  topics_count :integer         default(0), not null
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

require 'spec_helper'

describe Node do
  pending "add some examples to (or delete) #{__FILE__}"
end

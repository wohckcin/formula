# == Schema Information
#
# Table name: sections
#
#  id                :integer         not null, primary key
#  name              :string(255)
#  title             :string(255)
#  title_alternative :string(255)
#  description       :text
#  postion_at        :integer         default(0), not null
#  nodes_count       :integer         default(0), not null
#  created_at        :datetime        not null
#  updated_at        :datetime        not null
#

require 'spec_helper'

describe Section do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: topics
#
#  id            :integer         not null, primary key
#  user_id       :integer
#  title         :string(255)
#  content       :text
#  content_html  :text
#  type          :string(255)
#  node_id       :integer
#  replies_count :integer         default(0), not null
#  likes_count   :integer         default(0), not null
#  views_count   :integer         default(0), not null
#  replied_at    :datetime
#  sticky_at     :datetime
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#

require 'spec_helper'

describe Topic do
  pending "add some examples to (or delete) #{__FILE__}"
end

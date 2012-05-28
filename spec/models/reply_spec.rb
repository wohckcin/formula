# == Schema Information
#
# Table name: replies
#
#  id           :integer         not null, primary key
#  user_id      :integer
#  topic_id     :integer
#  content      :text
#  content_html :text
#  likes_count  :integer         default(0), not null
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

require 'spec_helper'

describe Reply do
  pending "add some examples to (or delete) #{__FILE__}"
end

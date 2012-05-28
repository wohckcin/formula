require 'spec_helper'

describe Post do
  pending "add some examples to (or delete) #{__FILE__}"
end
# == Schema Information
#
# Table name: posts
#
#  id             :integer         not null, primary key
#  user_id        :integer
#  title          :string(255)
#  content        :text
#  content_html   :text
#  type           :string(255)
#  node_id        :integer
#  comments_count :integer         default(0), not null
#  likes_count    :integer         default(0), not null
#  views_count    :integer         default(0), not null
#  commented_at   :datetime
#  sticky_at      :datetime
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#


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

class Reply < ActiveRecord::Base
  belongs_to :user, inverse_of: :replies
  belongs_to :topic, inverse_of: :replies
  attr_accessible :content, :content_html, :likes_count
end

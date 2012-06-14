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
  belongs_to :topic, inverse_of: :replies, counter_cache: true
  attr_accessible :content, :content_html, :likes_count
  validates_presence_of :user_id, :content

  before_save :markdown_content
  
  scope :recent, order('id DESC')

  after_create :update_parent_topic
  def update_parent_topic
    topic.update_last_reply(self)
  end

  private

    def markdown_content
      self.content_html = MarkdownTopicConverter.format(self.content) if self.content_changed?
    end
end

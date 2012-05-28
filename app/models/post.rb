class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :node
  attr_accessible :commented_at, :comments_count, :content, :content_html, :likes_count, :sticky_at, :title, :type, :views_count
end

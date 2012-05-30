# coding: utf-8
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

class Topic < ActiveRecord::Base
  belongs_to :user, inverse_of: :topics
  belongs_to :node, counter_cache: true
  has_many :replies, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  attr_accessible :content, :content_html, :likes_count, :replied_at, :replies_count, :title, :type, :views_count
  validates_presence_of :user_id, :title, :body, :node_id

  # scopes
  # recently published
  scope :recent, order('id DESC')
  # last_actived should be order by replied_at; if replied_at is NULL, then order by created_at.
  scope :last_actived, order("IFNULL(replied_at, created_at) DESC")
  # highly recommended
  scope :recommended, where("sticky_at IS NOT NULL").order("sticky_at DESC")

end

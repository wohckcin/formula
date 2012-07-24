# == Schema Information
#
# Table name: likes
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  likeable_id   :integer
#  likeable_type :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :likeable, polymorphic: true, counter_cache: true

  attr_accessible :user_id, :likeable

  scope :recent, order("id DESC")
  scope :topics, where(likeable_type: 'Topic')

  def self.find_likes_cast_by_user(user)
          find(:all,
              conditions: ["user_id = ? ", user.id],
              order: "created_at DESC"
          )
  end
end

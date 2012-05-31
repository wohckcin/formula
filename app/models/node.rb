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

class Node < ActiveRecord::Base
  belongs_to :section, counter_cache: true
  has_many :topics
  attr_accessible :description, :name, :postion_at, :posts_count, :slug, :status, :section_id
  scope :sorted, order('postion_at DESC')
end

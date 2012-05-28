class Node < ActiveRecord::Base
  belongs_to :section
  attr_accessible :description, :name, :postion_at, :posts_count, :slug, :status
end

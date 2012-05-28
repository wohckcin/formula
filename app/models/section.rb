class Section < ActiveRecord::Base
  attr_accessible :description, :name, :nodes_count, :postion_at, :title, :title_alternative
end

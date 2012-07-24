# == Schema Information
#
# Table name: sections
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  title             :string(255)
#  title_alternative :string(255)
#  description       :text
#  postion_at        :integer          default(0), not null
#  nodes_count       :integer          default(0), not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Section < ActiveRecord::Base
  has_many :nodes
  attr_accessible :description, :name, :nodes_count, :postion_at, :title, :title_alternative
  def sorted_nodes
    self.nodes.sorted
  end
end

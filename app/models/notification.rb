# == Schema Information
#
# Table name: notifications
#
#  id           :integer          not null, primary key
#  target_id    :integer
#  target_type  :string(255)
#  recipient_id :integer          not null
#  type         :string(255)
#  unread       :boolean          default(TRUE), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Notification < ActiveRecord::Base
  belongs_to :recipient, class_name: 'User'
  belongs_to :target, polymorphic: true
  # attr_accessible :title, :body

  attr_accessor :note_html

  scope :recent, order("id DESC")
  scope :unread, where(:unread => true)

  def self.for(recipient, opts={})
    self.where(opts.merge!(:recipient_id => recipient.id)).order('updated_at desc')
  end

  def anchor
    "notification-#{id}"
  end

end

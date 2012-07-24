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

require 'spec_helper'

describe Notification do
  pending "add some examples to (or delete) #{__FILE__}"
end

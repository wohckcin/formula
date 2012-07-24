# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  nickname   :string(255)
#  gender     :string(255)
#  birthday   :date
#  bio        :text
#  tagline    :string(255)
#  avatar     :string(255)
#  location   :string(255)
#  website    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Profile do
  pending "add some examples to (or delete) #{__FILE__}"
end

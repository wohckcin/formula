class Profile < ActiveRecord::Base
  attr_accessible :avatar, :bio, :birthday, :gender, :location, :nickname, :tagline, :user_id, :website

  belongs_to :user

  mount_uploader :avatar, AvatarUploader
end
# == Schema Information
#
# Table name: profiles
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  nickname   :string(255)
#  gender     :string(255)
#  birthday   :date
#  bio        :text
#  tagline    :string(255)
#  avatar     :string(255)
#  location   :string(255)
#  website    :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#


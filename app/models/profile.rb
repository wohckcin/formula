class Profile < ActiveRecord::Base
  attr_accessible :avatar, :bio, :birthday, :gender, :location, :nickname, :tagline, :user_id, :website
end

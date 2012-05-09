# coding: utf-8
class User < ActiveRecord::Base
	rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :token_authenticatable,
         :encryptable, :timeoutable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence:true, uniqueness: { case_sensitive: false }


end

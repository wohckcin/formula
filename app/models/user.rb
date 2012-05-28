# coding: utf-8
class User < ActiveRecord::Base
	rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :token_authenticatable,
         :encryptable, :timeoutable

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login, :display_name

  # Setup accessible (or protected) attributes for your model
  attr_accessible :login, :username, :email, :password, :password_confirmation, :remember_me, :display_name
  # attr_accessible :title, :body

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence:true, uniqueness: { case_sensitive: false }

  # join profiles to users => one to one
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile

  # join topics to users => one to many
  has_many :topics

  # Set a default of an empty profile when a new User record is instantiated.
  # Passing :profile => nil to User.new will instantiate a person with no profile.
  # Calling User.new with a block:
  #   User.new do |p|
  #     p.profile = nil
  #   end
  # will not work!  The nil profile will be overriden with an empty one.
  def initialize(params={})
    profile_set = params.has_key?(:profile) || params.has_key?("profile")
    params[:profile_attributes] = params.delete(:profile) if params.has_key?(:profile) && params[:profile].is_a?(Hash)
    super
    self.profile ||= Profile.new unless profile_set
  end

  # Overwrite Devise’s find_for_database_authentication method in Users model
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { value: login.downcase }]).first
    else
      where(conditions).first
    end
  end

  # if nickname is not null use nickname, otherwise use username instead
  def display_name
    self.display_name = self.profile.nickname? ? self.profile.nickname : self.username
  end

end
# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(255)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  password_salt          :string(255)
#  authentication_token   :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  username               :string(255)     default(""), not null
#


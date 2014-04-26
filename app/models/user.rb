class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :secure_validatable, :confirmable
  devise :omniauthable, :omniauth_providers => [:facebook]

  validates :username, length: { minimum: 4, :message => "The username should have more than 4 characters"}

  has_many :income_types
  has_many :expense_types

  has_many :invitations, :class_name => self.to_s, :as => :invited_by

def invitations_remaining
  invitation_limit - invitations.count
end

def self.find_for_facebook_oauth(auth)
  where(auth.slice(:provider, :uid)).first_or_create do |user|
    user.provider = auth.provider
    user.uid = auth.uid
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.username = auth.info.name   # assuming the user model has a name
    #user.image = auth.info.image # assuming the user model has an image
  end
end

end
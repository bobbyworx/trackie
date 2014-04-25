class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :secure_validatable, :confirmable

  validates :username, length: { minimum: 4, :message => "The username should have more than 4 characters"}

  has_many :income_types
  has_many :expense_types

  end
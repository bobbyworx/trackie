class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :secure_validatable, :confirmable

  validates :username, length: { minimum: 4, :message => "The username should have more than 4 characters"}

  #validates :password, :format => {:with => /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,}$/,
   #:multiline => true, message: "must be at least 6 characters and include one number and one letter."}
  end
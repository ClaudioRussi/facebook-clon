class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  validates_presence_of [:first_name, :last_name, :password_confirmation]
  validates :email, format: {with: VALID_EMAIL_REGEX}, length:{minimum:3, maximum:254}
  validates :password, length:{minimum:8,maximum:35}, presence:true
end

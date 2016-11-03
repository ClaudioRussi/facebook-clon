class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :commented_posts, through: :comments, source: :post

  #Friend relationship
  has_many :sent_friend_requests, class_name: 'FriendRequest', foreign_key: :sender_id
  has_many :received_friend_requests, class_name: 'FriendRequest', foreign_key: :receiver_id
  has_many :friend_request_senders, through: :received_friend_request, source: :sender_id
  has_many :friend_request_receiver, through: :sent_friend_request, source: :receiver_id
  #confirmed frienship
  has_many :received_friendships, -> {where status:'Confirmed'}, class_name: 'FriendRequest', foreign_key: :receiver_id
  has_many :received_friends, through: :received_friendship, source: :receiver_id
  has_many :sent_friendships, -> {where status:'Confirmed'}, class_name: 'FriendRequest', foreign_key: :sender_id
  has_many :sent_friends, through: :sent_friendship, source: :sender_id
  #friendship
  has_many :inverse_friendships, foreign_key: :friend_id, class_name: 'Friendship'
  has_many :friendships, foreign_key: :user_id
  has_many :friended_by, through: :invere_friendships, foreign_key: :user_id
  has_many :friends, through: :friendships
  has_many :friend_posts, through: :friends, source: :posts

  has_and_belongs_to_many :liked_posts, class_name: 'Post', join_table: :posts_users, foreign_key: :user_id

  validates_presence_of [:first_name, :last_name, :password_confirmation]
  validates :email, format: {with: VALID_EMAIL_REGEX}, length:{minimum:3, maximum:254}
  validates :password, length:{minimum:8,maximum:35}, presence:true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end



end

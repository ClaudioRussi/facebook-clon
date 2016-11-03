class Post < ApplicationRecord

  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :likers, class_name: 'User', join_table: :posts_users, foreign_key: :post_id
  has_many :comments
  has_many :commentors, through: :comments, source: :author, class_name: 'User'

  validates :body, presence:true, length:{minimum:25}
end

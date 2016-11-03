class Comment < ApplicationRecord

  belongs_to :post
  belongs_to :author, class_name: 'User'

  validates :body, presence: true, length:{minimum: 1, maximum:400}
  validates_presence_of :author_id
  validates_presence_of :post_id

end

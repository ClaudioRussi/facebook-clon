class FriendRequest < ApplicationRecord
  scope :unconfirmed, -> (user_id){where("status = ? AND receiver_id = ?","Unconfirmed",user_id)}
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'


end

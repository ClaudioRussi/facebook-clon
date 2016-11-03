class CreateFriendRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :friend_requests do |t|
      t.integer :sender_id, foreign_key: true, index:true
      t.integer :receiver_id, foreign_key: true, index:true
      t.string :status, default: 'Unconfirmed'

      t.timestamps
    end
  end
end

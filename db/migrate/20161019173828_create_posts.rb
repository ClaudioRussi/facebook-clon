class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :body
      t.integer :author_id, foreign_key: true, index: true
      
      t.timestamps
    end
  end
end

class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :post_id, foreign_key: true, index: true
      t.integer :author_id, foreign_key: true, index: true
      t.text :body

      t.timestamps
    end
  end
end

class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.integer :likecount
      t.integer :liketype
      t.timestamps
    end
  end
end

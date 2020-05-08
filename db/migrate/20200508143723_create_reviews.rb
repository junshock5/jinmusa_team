class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.integer :ReviewScore, foreign_key: true
      t.string :ReviewContents, foreign_key: true
      t.timestamps
    end
  end
end
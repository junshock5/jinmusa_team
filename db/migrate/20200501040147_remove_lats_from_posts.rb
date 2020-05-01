class RemoveLatsFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :lats, :float
  end
end

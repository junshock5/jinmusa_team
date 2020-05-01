class AddLatToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :lat, :float
  end
end

class DropPosts < ActiveRecord::Migration[5.2]
  def change
    drop_table(:Posts, if_exists: true)
  end
end

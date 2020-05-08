class DropLikes < ActiveRecord::Migration[5.2]
  def change
    drop_table(:likes, if_exists: true)
  end
end

class AddColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :teacher, :text
    add_column :posts, :image, :image
    add_column :posts, :video, :image
    add_column :posts, :timetable, :image

  end
end

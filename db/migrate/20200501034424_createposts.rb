class Createposts < ActiveRecord::Migration[5.2]
  def change
     create_table :Posts do |t|
      t.integer :CourtCategoryId
      t.string :CourtName
      t.string :CountIntro
      t.string :CourtSubIntro
      t.datetime :Created
      t.datetime :Updated
      t.integer :UserId
      t.integer :ImageId
      t.integer :TimeTableId
      t.string :file
      t.integer :lat
      t.integer :lng 
     end 
  end
    

end

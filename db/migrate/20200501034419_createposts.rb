class Createposts < ActiveRecord::Migration[5.2]
  def change
    
     create_table :posts do |t|
      
      t.string :title
      t.text :content
      t.string :call
      t.float :lats
      t.float :lng
      t.timestamps
      
    
     end 
  end
    

end
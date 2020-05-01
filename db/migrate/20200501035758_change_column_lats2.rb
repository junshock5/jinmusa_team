class ChangeColumnLats2 < ActiveRecord::Migration[5.2]
  def change
    
      def up
        change_column :posts, :lat, :float
      end

      def down
        change_column :posts, :lats, :float
      end
  end
end

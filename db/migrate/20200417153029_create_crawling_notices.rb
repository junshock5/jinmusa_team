class CreateCrawlingNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :crawling_notices do |t|
      t.string :title
      t.string :campus
      t.string :url

      t.timestamps
    end
  end
end

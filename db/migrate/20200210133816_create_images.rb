class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :URL 
      t.string :metro_link 
      t.string :artist 
      t.string :date_created
      t.timestamps
    end
  end
end

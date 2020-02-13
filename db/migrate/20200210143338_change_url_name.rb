class ChangeUrlName < ActiveRecord::Migration[6.0]
  def change
    rename_column :images, :URL, :url
  end
end

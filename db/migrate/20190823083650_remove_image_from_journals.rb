class RemoveImageFromJournals < ActiveRecord::Migration[5.2]
  def change
    remove_column :journals, :image, :text
  end
end

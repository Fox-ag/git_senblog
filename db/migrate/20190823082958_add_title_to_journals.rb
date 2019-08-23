class AddTitleToJournals < ActiveRecord::Migration[5.2]
  def change
    add_column :journals, :title, :string
  end
end

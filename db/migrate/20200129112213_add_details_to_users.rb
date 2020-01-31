class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :selfanalysis, :text
    add_column :users, :selfintroduction, :text
  end
end

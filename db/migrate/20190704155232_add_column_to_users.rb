class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :family_name, :string
    add_column :users, :first_name, :string
    add_column :users, :family_name_kana, :string
    add_column :users, :first_name_kana, :string
    add_column :users, :nickname, :string
    add_column :users, :birthdate, :integer
    add_column :users, :country, :string
    add_column :users, :city, :string
  end
end

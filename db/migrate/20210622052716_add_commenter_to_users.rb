class AddCommenterToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :commenter, :integer, default: 0, null: false
  end
end

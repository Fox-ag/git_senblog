class AddBloggerToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :blogger, :integer, default: 0, null: false
  end
end

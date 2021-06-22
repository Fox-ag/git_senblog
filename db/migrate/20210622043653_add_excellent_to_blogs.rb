class AddExcellentToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :excellent, :integer, default: 0, null: false
  end
end

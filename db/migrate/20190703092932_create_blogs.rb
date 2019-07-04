class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string         :user_name
      t.text           :text
      t.text           :image
      t.timestamps null: true
    end
  end
end
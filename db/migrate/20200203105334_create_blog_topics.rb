class CreateBlogTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_topics do |t|
      t.references :blog, foreign_key: true
      t.references :theme, foreign_key: true
     
      t.timestamps null: false
    end
  end
end

class CreateBlogFeelings < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_feelings do |t|
      t.references :blog, foreign_key: true
      t.references :emotion, foreign_key: true
     
      t.timestamps null: false
    end
  end
end

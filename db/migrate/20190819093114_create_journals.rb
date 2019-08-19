class CreateJournals < ActiveRecord::Migration[5.2]
  def change
    create_table :journals do |t|
      t.string         :user_name
      t.text           :text
      t.text           :image
      t.integer        :user_id
      t.timestamps null: true
    end
  end
end

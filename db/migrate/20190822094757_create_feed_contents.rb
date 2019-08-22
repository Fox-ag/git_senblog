class CreateFeedContents < ActiveRecord::Migration[5.2]
  def change
    create_table :feed_contents do |t|

      t.timestamps
    end
  end
end

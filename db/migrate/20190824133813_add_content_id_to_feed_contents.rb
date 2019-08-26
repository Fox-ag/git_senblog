class AddContentIdToFeedContents < ActiveRecord::Migration[5.2]
  def change
    add_column :feed_contents, :content_id, :integer
  end
end

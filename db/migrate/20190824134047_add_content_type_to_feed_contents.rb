class AddContentTypeToFeedContents < ActiveRecord::Migration[5.2]
  def change
    add_column :feed_contents, :content_type, :string
  end
end

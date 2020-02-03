class CreateJournalPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :journal_photos do |t|
      t.integer :journal_id
      t.string :photo

      t.timestamps
    end
  end
end

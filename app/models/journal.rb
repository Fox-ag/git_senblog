class Journal < ApplicationRecord
    after_create :create_feed_content
    
    has_many :journal_photos, foreign_key: :journal_id, dependent: :destroy
    accepts_nested_attributes_for :journal_photos, allow_destroy: true, reject_if: proc { |attributes| attributes['photo'].blank? }
    
    belongs_to :user
    has_one :feed_content, as: :content, dependent: :destroy
    
    private
    def create_feed_content
        self.feed_content = FeedContent.create(user_id: user_id, updated_at: updated_at)
    end
end

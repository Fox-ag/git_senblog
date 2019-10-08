class Blog < ApplicationRecord
    after_create :create_feed_content
    
    
    belongs_to :user
    has_one :feed_content, as: :content, dependent: :destroy
    
    has_many :likes
    has_many :liked_users, through: :likes, source: :user

    private
    def create_feed_content
        self.feed_content = FeedContent.create(user_id: user_id, updated_at: updated_at)
    end
end

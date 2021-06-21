class Blog < ApplicationRecord
    after_create :create_feed_content
    validates :title, presence: true
    enum status: { draft: 0, published: 1}
    
    has_many :blog_photos, foreign_key: :blog_id, dependent: :destroy
    accepts_nested_attributes_for :blog_photos, allow_destroy: true, reject_if: proc { |attributes| attributes['photo'].blank? }
    
    has_many :blog_images, foreign_key: :blog_id, dependent: :destroy
    accepts_nested_attributes_for :blog_images, allow_destroy: true, reject_if: proc { |attributes| attributes['image'].blank? }
    
    belongs_to :user
    has_one :feed_content, as: :content, dependent: :destroy
    
    has_many :likes
    has_many :liked_users, through: :likes, source: :user, dependent: :destroy
    
    has_many :blog_feelings, dependent: :destroy
    has_many :emotions, through: :blog_feelings
    accepts_nested_attributes_for :blog_feelings, allow_destroy: true
    
    has_many :blog_topics, dependent: :destroy
    has_many :themes, through: :blog_topics
    accepts_nested_attributes_for :blog_topics, allow_destroy: true
    
    has_many :comments, dependent: :destroy

    private
    def create_feed_content
        self.feed_content = FeedContent.create(user_id: user_id, updated_at: updated_at)
    end
end

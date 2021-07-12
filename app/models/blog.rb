class Blog < ApplicationRecord
    is_impressionable counter_cache: true  #PV数確認のために実装したが、エラー発生により使用中止
    after_create :create_feed_content
    validates :title, presence: true
    enum status: { draft: 0, published: 1}
    
    enum excellent: { normal: 0, excellent: 1}
    
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
    
    has_many :notifications, dependent: :destroy

    def create_notification_like!(current_user)
    # すでに「いいね」されているか検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and blog_id = ? and action = ? ", current_user.id, user_id, id, 'like'])
    # いいねされていない場合のみ、通知レコードを作成
        if temp.blank?
          notification = current_user.active_notifications.new(
            blog_id: id,
            visited_id: user_id,
            action: 'like'
          )
          # 自分の投稿に対するいいねの場合は、通知済みとする
          if notification.visitor_id == notification.visited_id
            notification.checked = true
          end
          notification.save if notification.valid?
        end
    end
    
    def create_notification_comment!(current_user, comment_id)
        # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
        temp_ids = Comment.select(:user_id).where(blog_id: id).where.not(user_id: current_user.id).distinct
        temp_ids.each do |temp_id|
          save_notification_comment!(current_user, comment_id, temp_id['user_id'])
        end
        # まだ誰もコメントしていない場合は、投稿者に通知を送る
        save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
    end

    def save_notification_comment!(current_user, comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
        notification = current_user.active_notifications.new(
          blog_id: id,
          comment_id: comment_id,
          visited_id: visited_id,
          action: 'comment'
        )
        # 自分の投稿に対するコメントの場合は、通知済みとする
        if notification.visitor_id == notification.visited_id
          notification.checked = true
        end
        notification.save if notification.valid?
    end

    private
    def create_feed_content
        self.feed_content = FeedContent.create(user_id: user_id, updated_at: updated_at)
    end
end

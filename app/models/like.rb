class Like < ApplicationRecord
    belongs_to :blog, optional: true
    belongs_to :user, optional: true
    validates_uniqueness_of :blog_id, scope: :user_id
end

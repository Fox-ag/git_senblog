class Theme < ApplicationRecord
    has_many :blog_topics
    has_many :blogs, through: :blog_topics
end

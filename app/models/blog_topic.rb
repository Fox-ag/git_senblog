class BlogTopic < ApplicationRecord
    belongs_to :blog
    belongs_to :theme
end

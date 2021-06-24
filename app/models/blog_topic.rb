class BlogTopic < ApplicationRecord
    belongs_to :blog, optional: true
    belongs_to :theme, optional: true
end

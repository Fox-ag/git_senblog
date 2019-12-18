class Emotion < ApplicationRecord
    has_many :blog_feelings
    has_many :blogs, through: :blog_feelings
end

class Emotion < ApplicationRecord
    has_many :blog_feelings, dependent: :destroy
    has_many :blogs, through: :blog_feelings
end

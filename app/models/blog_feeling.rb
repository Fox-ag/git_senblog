class BlogFeeling < ApplicationRecord
    belongs_to :blog
    belongs_to :emotion
end

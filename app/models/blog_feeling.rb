class BlogFeeling < ApplicationRecord
    belongs_to :blog, optional: true
    belongs_to :emotion, optional: true
end

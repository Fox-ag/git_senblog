class Comment < ApplicationRecord
    belongs_to :blog, optional: true
    belongs_to :user, optional: true
    has_many :notifications, dependent: :destroy
end

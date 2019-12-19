class BlogPhoto < ApplicationRecord
    mount_uploader :photo, PhotoUploader
    belongs_to :blog
end

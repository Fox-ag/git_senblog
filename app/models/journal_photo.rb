class JournalPhoto < ApplicationRecord
    mount_uploader :photo, PhotoUploader
    belongs_to :journal, optional: true
end

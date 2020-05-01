class Video < ApplicationRecord
    mount_uploader :file, VideoUploader
end

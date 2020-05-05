class Post < ApplicationRecord
    #belongs_to :user
    has_one_attached :image
    mount_uploader :file, VideoUploader
    #has_one_attached :timetable
    
    
end

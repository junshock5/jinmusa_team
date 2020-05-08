class Post < ApplicationRecord
    belongs_to :user, optional: true
    has_one_attached :image
    mount_uploader :file, VideoUploader
    #has_one_attached :timetable
    has_many :likes
    has_many :liked_users, through: :likes, source: :user
    
end

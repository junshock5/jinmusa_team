class Post < ApplicationRecord
    #belongs_to :user
    has_one_attached :image
    #has_one_attached :timetable
    
    
end

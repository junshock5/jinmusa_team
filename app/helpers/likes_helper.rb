module LikesHelper
    def post_liked_by_user?(post, user) 
        like = Like.find_by(post_id: post.id, user_id: user.id)
        return like.present? ? true : false
    end
end

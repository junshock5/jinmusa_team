class LikesController < ApplicationController
  before_action :authenticate_user!
  
  def create
      @like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
      
      if @like.present?
        @like.destroy
        
        @like = nil
      else
        @like =Like.create(post_id: params[:post_id], user_id: current_user.id)
      end
      
      @post = Post.find(params[:post_id])
      @like_count = @post.likes.count
      #redirect_back(fallback_location: root_path)
  end
end

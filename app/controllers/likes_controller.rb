class LikesController < ApplicationController
  before_action :authenticate_user!
  
  def create
      @like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
      
      #if @like.present?
      #  @like.destroy 
      #  @like = nil
      #else
      #  @like =Like.create(post_id: params[:post_id], user_id: current_user.id)
      #end
      
      if @like.present?
            @like.likecount=@like.likecount+1;
            @like.save;

      else
        @like =Like.create(post_id: params[:post_id], user_id: current_user.id, likecount:1, liketype:1);
      end
      
      @post = Post.find(params[:post_id])
      @like_count = @post.likes.count
      #redirect_back(fallback_location: root_path)
  end
  
  def showcount
    
  end
end

class ReviewsController < ApplicationController
before_action :authenticate_user!
  def new
    @review = Review.new
    @post = params[:post_id]
  end
  def create
    @review = Review.new
    @review.ReviewContents = params[:ReviewContents]
    reviewscore = params[:ReviewScore]
    @review.ReviewScore = reviewscore.to_i
    @review.post_id = params[:post_id]
    @review.user_id = current_user.id
    @review.save
    @post = params[:post_id]
    redirect_to "/posts/#{@post}"
  end
end
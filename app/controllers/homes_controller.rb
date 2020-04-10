class HomesController < ApplicationController
  def index
    session[:conversations] ||= []
 
    @users = User.all.where.not(id: current_user)
    @conversations = Conversation.all
    #@conversations = Conversation.includes(:recipient, :messages)
                                # .find(session[:conversations])
  end
end

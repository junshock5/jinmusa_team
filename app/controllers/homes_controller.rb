class HomesController < ApplicationController
  def index

    if user_signed_in?
    session[:conversations] ||= []
 
    @users = User.all.where.not(id: current_user)
    @conversations = Conversation.all
    
   else
      redirect_to controller: 'users', action: 'sign_in', params_name: "test"
    end
    #@conversations = Conversation.includes(:recipient, :messages)
                                # .find(session[:conversations])
  end
end

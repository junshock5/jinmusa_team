Rails.application.routes.draw do
  resources :videos
  devise_for :users
  
  get 'posts/paging' => 'posts#paging'
  
  resources :posts #scaffold url을 다정의? 
  #devise_for :users



  resources :conversations, only: [:create] do
    member do
        post :close
    end
    resources :messages, only: [:create]
  end
  

  get 'homes/index'
  get 'grayscale/index'
  get 'grayscale/crawling'
  
  #get 'posts' => 'posts#index'
  #get 'posts/index'
  get 'posts/new'
  get 'posts/:id' => 'posts#show'
  post 'posts/:post_id/likes' => 'likes#create'
  #get 'posts/show'
  
  
  get 'messages/create'
  get 'conversations/create'
  
  get 'conversations/conversated'
  get 'game/javascript_car'
  get 'users/sign_in'
  mount ActionCable.server => '/cable'

  root 'grayscale#index'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

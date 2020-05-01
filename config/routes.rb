Rails.application.routes.draw do
  devise_for :users
  resources :posts
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
  
  get 'posts' => 'posts#index'
  get 'posts/index'
  get 'posts/new'
  get 'posts/show'
  #get 'posts/:id' => 'posts#show'
  
  get 'messages/create'
  get 'conversations/create'
  
  get 'conversations/conversated'
  
  mount ActionCable.server => '/cable'

  root 'grayscale#index'
  
  root 'posts#index'
  #root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

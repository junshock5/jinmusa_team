Rails.application.routes.draw do
  resources :posts
  devise_for :users



  resources :conversations, only: [:create] do
    member do
        post :close
    end
    resources :messages, only: [:create]
  end

  get 'homes/index'
  get 'grayscale/index'
  
  
  get 'posts/index'
  get 'posts/new'
  
  get 'messages/create'
  get 'conversations/create'
  
  get 'conversations/conversated'
  
  root 'grayscale#index'
  #root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  resources :posts
  devise_for :users
  get 'grayscale/index'
  
  
  get 'posts/index'
  get 'posts/new'
  
  
  root 'grayscale#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

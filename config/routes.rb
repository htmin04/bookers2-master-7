Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get '/home/about' => 'homes#about'
  resources :users,only: [:show,:index,:edit,:update] 
    resource :relationships, only:[:create, :destroy]
    
  get 'follows' => 'relationships#follower'
  get 'followers' => 'relationships#followed'
  
  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  
  
end
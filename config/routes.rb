Rails.application.routes.draw do
  get 'search/search'
  devise_for :users
  root 'homes#top'
  get '/home/about' => 'homes#about'

  resources :users,only: [:show,:index,:edit,:update] do
    resource :relationships, only:[:create, :destroy]
    member do
      get 'follows'
      get 'followers'
    end
  end
  
  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  get '/search' => 'search#search'

end
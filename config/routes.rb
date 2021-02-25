Rails.application.routes.draw do
  get 'search/search'
  devise_for :users
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  
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
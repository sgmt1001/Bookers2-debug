Rails.application.routes.draw do

  devise_for :users
    root to:'homes#top'
    resources :books do
      resources :book_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end

    get 'home/about' => 'homes#about'
    resources :users,only: [:show,:index,:edit,:update]

    post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
    post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
    get 'following_users/:id' => 'users#following_users',as: 'following_users'
    get 'follower_users/:id' => 'users#follower_users', as: 'follower_users'
    get '/search' => 'searchs#search'
  end
Rails.application.routes.draw do

  devise_for :users
  root to:'homes#top'
  resources :books
  get 'home/about' => 'homes#about'
  resources :users,only: [:show,:index,:edit,:update]

end

#resources :users,only: [:show,:index,:edit,:update]
#resources :books
#devise_for :users
#root 'homes#top'
#get 'home/about' => 'homes#about'
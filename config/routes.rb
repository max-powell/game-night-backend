Rails.application.routes.draw do
  resources :users, only: [:create, :update]
  resources :games, only: [:index, :create]
  resources :events, only: [:index, :create]
  resources :friends, only: :index

  get '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  post '/friends', to: 'friends#add_friend'

end

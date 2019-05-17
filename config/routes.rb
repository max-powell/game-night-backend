Rails.application.routes.draw do
  resources :users, only: [:create, :update]
  resources :games, only: [:index, :create]
  resources :events, only: [:index, :create]
  resources :friends, only: :index

  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'

  post '/friends', to: 'friends#add_friend'

  get '/users/search'

end

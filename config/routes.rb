Rails.application.routes.draw do
  resources :users, only: [:create, :update]
  resources :games, only: [:index, :create]
  resources :events, only: [:index, :create]

  get '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  get '/friends', to: 'users#friends'

end

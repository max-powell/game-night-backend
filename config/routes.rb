Rails.application.routes.draw do
  resources :users, only: [:show, :create, :update] do
    resources :games, only: :index
    resources :events, only: :index
    get '/friends', to: 'user#friends'
  end
  # resources :attendances
  # resources :events
  # resources :ownerships
  # resources :friendships
end

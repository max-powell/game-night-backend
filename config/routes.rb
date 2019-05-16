Rails.application.routes.draw do
  resources :users, only: [:create, :update] do
    resources :games, only: [:index, :create]
    resources :events, only: [:index, :create]
  end

  get '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'

  resources :games, only: :update

  get 'users/:id/friends', to: 'users#friends'

end

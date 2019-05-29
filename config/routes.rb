Rails.application.routes.draw do
  get 'attendances/destroy'
  resources :users, only: [:create, :update]
  resources :games, only: [:index, :create]
  resources :events, only: [:index, :show, :create, :update]
  resources :friends, only: :index
  resources :friend_requests, except: [:show, :new, :edit]
  resources :event_invites, only: [:index, :create, :update, :destroy]

  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'

  post '/friends', to: 'friends#add_friend'

  get 'users/:user_id/games', to: 'games#user_games'

  get 'search/:query', to: 'users#search'

  get 'games/search/:query', to: 'games#search'

  delete 'events/:id', to: 'events#leave'

end

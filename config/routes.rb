Rails.application.routes.draw do
  resources :attendances
  resources :events
  resources :ownerships
  resources :games
  resources :friendships
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

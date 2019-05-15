Rails.application.routes.draw do
  resources :users, only: [:show, :create, :update] do
    resources :games, only: [:index, :create]
    resources :events, only: :index
  end

  resources :games, only: :update

  get 'users/:id/friends', to: 'users#friends'

end

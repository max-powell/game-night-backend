Rails.application.routes.draw do
  resources :users, only: [:show, :create, :update] do
    resources :games, only: :index
    resources :events, only: :index
    get '/friends', to: 'users#friends'
  end

end

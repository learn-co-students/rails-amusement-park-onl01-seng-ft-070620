Rails.application.routes.draw do
  root to: 'application#home'
  get '/signin', to: 'sessions#signin'
  post '/signin', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  post '/attractions/:id', to: 'attractions#take_ride'
  resources :users
  resources :rides
  resources :attractions#, only: [:index, :show, :take_ride]

  # namespace :admin do
  #   resources :attractions, only: [:edit, :update, :new, :destroy]
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

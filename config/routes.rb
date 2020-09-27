Rails.application.routes.draw do
  resources :rides
  resources :attractions
  resources :users

  # get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  post '/session', to: 'sessions#create'
  delete '/session', to: 'sessions#destroy'

  root 'sessions#new'


end

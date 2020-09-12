Rails.application.routes.draw do
  resources :users
  resources :attractions
  resources :rides

  get '/signin', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  post '/signin', to: 'sessions#create'
  
  root 'welcome#home'
  
end

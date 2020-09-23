Rails.application.routes.draw do
  root 'static#home'
  resources :users, :attractions, :users, :rides, :sessions 
  get '/signin', to: 'session#new', as: 'signin'
end 
  
  

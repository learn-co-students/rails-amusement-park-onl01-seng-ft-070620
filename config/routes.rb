Rails.application.routes.draw do
  root 'users#new'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  resources :users, only: [:new, :create, :show]
  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]
  resources :rides, only: [:create]
end

Rails.application.routes.draw do

  get 'sessions/new'

  root to: 'dashboard#index'

  resources :products

  resources :users

  resources :sessions

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do

  get 'store/index'

  root to: 'products#index'

  resources :products

  resources :store

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  root to: 'orders#index'

  resources :orders  
  resources :executors
  resources :categories
end

Rails.application.routes.draw do
  resources :materials, except: :show
  resources :products 
  root to: 'orders#index'
end
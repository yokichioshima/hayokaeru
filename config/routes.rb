Rails.application.routes.draw do
  resources :materials, except: :show
  resources :products 
  root to: 'orders#index'
  resources :orders, only: [:new, :create, :edit, :update, :destroy]
end
Rails.application.routes.draw do
  resources :materials, except: :show
  resources :products, only: [:index, :show, :new] 
end
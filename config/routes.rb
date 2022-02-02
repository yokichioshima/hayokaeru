Rails.application.routes.draw do
  resources :materials, except: :show
  resources :products, only: [:index, :new, :create] 
end
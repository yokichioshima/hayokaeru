Rails.application.routes.draw do
  resources :materials, except: :show
  resources :products 
end
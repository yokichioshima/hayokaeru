Rails.application.routes.draw do
  resources :materials, only: [:index, :new, :create]
end
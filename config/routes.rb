Rails.application.routes.draw do
  resources :materials, except: :show
  resources :products 
  root to: 'orders#index'
  resources :orders, except: :show do
    collection do
      get 'show_summary'
    end
  end
end
Rails.application.routes.draw do
  devise_for :customers
  get 'search/results'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #resources :charges
  resources :products, only: [:index, :show] do
    member do
      post :add_to_cart
      post :remove_from_cart
      post :update_cart
    end
    collection do
      post :clear_cart
    end
  end
  resources :categories, only: [:index, :show]
  get '/about_us', to: 'pages#about'
  get '/contact_us', to: 'pages#contact'
  get '/cart', to: 'pages#cart'
  get '/checkout', to: 'orders#checkout'
  post '/save_order', to: 'orders#pay'
  get '/orders', to: 'orders#index'
  # get '/pay', to: 'orders#pay'
  # get '/order_details', to: 'orders#show'

  root to: 'products#index'
end

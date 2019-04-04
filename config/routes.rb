Rails.application.routes.draw do
  devise_for :customers
  get 'search/results'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

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

  root to: 'products#index'
end

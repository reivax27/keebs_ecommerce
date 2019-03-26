Rails.application.routes.draw do
  devise_for :customers
  get 'search/results'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :products, only: [:index, :show]
  resources :categories, only: [:index, :show]
  get '/about_us', to: 'pages#about'
  get '/contact_us', to: 'pages#contact'

  root to: 'products#index'
end

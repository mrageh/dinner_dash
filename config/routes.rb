DinnerDash::Application.routes.draw do
  root to: 'categories#index'
  resources :items
  resources :categories
  resources :orders
  resources :order_items, :only => [:create, :destroy]
  resource  :session,     :only => [:new, :create, :destroy]
  resources :users
  get 'signup', to: 'users#new', as: 'signup'
  get 'dashboard', to: 'dashboard#index'

  # namespace :admin do
  #   resources :orders
  # end

  get 'checkout' => 'orders#checkout', as: 'checkout'

  # patch 'add_to_cart', to: 'orders#add_to_cart'
end

DinnerDash::Application.routes.draw do
  root to: 'items#index'
  resources :items
  resources :categories
  resources :orders
  resources :order_items, :only => [:create, :destroy]
  resource  :session,     :only => [:new, :create, :destroy]
  resources :users


  # patch 'add_to_cart', to: 'orders#add_to_cart'
end

DinnerDash::Application.routes.draw do
  match "/about", to: "static_pages#about", via: 'get'
  root to: 'categories#index'
  resources :items
  resources :categories
  resources :orders
  resources :order_items, :only => [:create, :destroy]
  resource  :session,     :only => [:new, :create, :destroy]
  resources :users
  get 'signup', to: 'users#new', as: 'signup'
  get 'dashboard', to: 'dashboard#index'
  get 'checkout' => 'orders#checkout', as: 'checkout'
end

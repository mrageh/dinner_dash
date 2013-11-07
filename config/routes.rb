DinnerDash::Application.routes.draw do
  root to: 'items#index'
  resources :items
  resources :categories
  resources :orders

end

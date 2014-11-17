Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users

  resources :products do
    resources :ingredients
  end
  resources :categories
  resources :product_sets
  resources :materials
  resources :components
  resources :component_types
end

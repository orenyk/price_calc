Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users

  resources :products
  resources :categories
  resources :families
  resources :components
  resources :component_types
end

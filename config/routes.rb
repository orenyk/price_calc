Rails.application.routes.draw do
  resources :component_categories

  resources :categories

  resources :manifests

  resources :products

  resources :components

  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
end

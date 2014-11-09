Rails.application.routes.draw do
  resources :categories

  resources :products

  resources :components

  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
end

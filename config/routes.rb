Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users

  resources :products do
    resources :ingredients
  end
  resources :categories, except: :show
  resources :product_lines, except: :show
  resources :product_sets, except: :show
  resources :materials, except: :show
  resources :components
  resources :component_types, except: :show
  resources :prices, except: :show
end

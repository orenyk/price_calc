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
  resources :components, except: :show
  resources :component_types, except: :show
  resources :prices, except: :show

  # reporting resource
  resources :reports, except: [:edit, :update]
end

Rails.application.routes.draw do
  root to: 'visitors#index'

  # help pages
  get '/help', to: 'helps#index', as: 'help'
  get '/help/components', to: 'help_reports#components', as: 'help_components'
  get 'help/products', to: 'helps#products', as: 'help_products'
  get 'help/reports', to: 'helps#reports', as: 'help_reports'

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

  # Any other routes are handled here (as ActionDispatch prevents
  # RoutingError from hitting ApplicationController::rescue_action).
  match "*path", :to => "application#routing_error", :via => :all
end

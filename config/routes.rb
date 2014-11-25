Rails.application.routes.draw do
  root to: 'visitors#index'

  # help pages
  get '/help', to: 'helps#index', as: 'help'
  get '/help/components', to: 'help_reports#components', as: 'help_components'
  get 'help/products', to: 'helps#products', as: 'help_products'
  get 'help/reports', to: 'helps#reports', as: 'help_reports'

  devise_for :users

  resources :products do
    resources :ingredients, except: [:new, :show, :edit]
  end
  resources :categories, except: :new
  resources :product_lines, except: :new
  resources :product_sets, except: :new
  resources :materials, except: :new
  resources :components, except: [:new, :show]
  resources :component_types, except: :new
  resources :prices, except: [:new, :show]

  # reporting resource
  resources :reports, except: [:index, :show, :edit, :update, :destroy]

  # Any other routes are handled here (as ActionDispatch prevents
  # RoutingError from hitting ApplicationController::rescue_action).
  match "*path", :to => "application#routing_error", :via => :all
end

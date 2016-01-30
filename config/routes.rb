Rails.application.routes.draw do
  root 'cmdrs#index'

  resources :cmdrs do
    resources :entries
    resources :ships, only: [:show]
  end

  resources :extracted_resources, only: [:create, :destroy]
  resources :stored_commodities, only: [:update]
end

Rails.application.routes.draw do
  root 'cmdrs#index'

  resources :cmdrs do
    resources :entries
  end

  resources :extracted_resources, only: [:create, :destroy], defaults: { format: :json }
end

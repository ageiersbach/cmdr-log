Rails.application.routes.draw do
  root 'cmdrs#index'
  resources :cmdrs do
    resources :entries
  end
end

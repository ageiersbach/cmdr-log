Rails.application.routes.draw do
  root 'cmdrs#index'
  resources :cmdrs
end

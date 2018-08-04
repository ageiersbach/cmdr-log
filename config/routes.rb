Rails.application.routes.draw do
  devise_for :commanders
  root to: "commanders#show"
  resources :commanders, only: [:show]
  resources :token, only: [:index, :create]
end

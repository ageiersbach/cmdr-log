Rails.application.routes.draw do
  devise_for :commanders
  root to: "commanders#show"
  resources :commanders, only: [:show]
end

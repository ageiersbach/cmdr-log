Rails.application.routes.draw do
  devise_for :commanders
  # For details on the DSL available within thris file, see http://guides.rubyonrails.org/routing.html
  root to: "commanders#index"
  resources :commanders
end

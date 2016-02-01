Rails.application.routes.draw do
  root 'cmdrs#index'
  post '/sold_items' => 'sold_items#create'


  resources :cmdrs do
    resources :entries
    resources :ships, only: [:show]
  end

  resources :extracted_resources, only: [:create, :destroy]
end

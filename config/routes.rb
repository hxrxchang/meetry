Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
  get "login", to: "sessions#new"
  resources :users
  resource :find
  resource :login, only: [:new, :create], controller: "sessions"
  resources :authenticates, only: [:new, :update]
  resources :pair_images, only: [:new, :create], path: "photo"
end

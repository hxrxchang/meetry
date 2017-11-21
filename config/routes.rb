Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
  resources :users
  resource :find
  resources :authenticates, only: [:new, :update]
  resources :pair_images, only: [:new, :create]
  resources :social_accounts
end

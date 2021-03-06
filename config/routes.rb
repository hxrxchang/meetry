Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
  get "login", to: "sessions#new"
  resources :users
  resource :find
  resource :login, only: [:new, :create], controller: "sessions"
  resources :authenticates, only: [:new, :update]
  resources :social_accounts
  resources :pair_images, only: [:new, :create], path: "photo"

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end

Rails.application.routes.draw do
  resources :artists
  resources :releases
  resources :songs

  get "/error", to: "error#index"

  root "home#index"
end

Rails.application.routes.draw do
  resources :artists
  resources :releases
  resources :songs

  root "home#index"
end

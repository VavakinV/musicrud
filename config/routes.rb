Rails.application.routes.draw do
  get "home/index"
  resources :artists
  resources :releases
  resources :songs
end

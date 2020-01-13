Rails.application.routes.draw do
  root "home#top"
  resources :users, only: [:index]
  resources :products, only: [:index, :show]
end

Rails.application.routes.draw do
  root "home#top"
  resources :user
  resources :products
end

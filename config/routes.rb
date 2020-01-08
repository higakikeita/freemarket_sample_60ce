Rails.application.routes.draw do
  root "home#top"
  
  resources :products, only: [:index]
end

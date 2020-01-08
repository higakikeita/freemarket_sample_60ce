Rails.application.routes.draw do
  root "home#top"
  get "/home/top" => "home#top"
  resources :products, only: [:index]
end

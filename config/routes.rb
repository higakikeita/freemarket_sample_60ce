Rails.application.routes.draw do
  get "/home/top" => "home#top"
  resources :products, only: [:index]
end

Rails.application.routes.draw do
  get 'home/top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "home#top"
  root "products#index"
end

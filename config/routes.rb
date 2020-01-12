Rails.application.routes.draw do
  devise_for :users, controllers: {
  registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root to: "home#top"
  get "/step0" => "registration#index_step0"
  get "/step1" => "registration#index_step1"

  resources :products, only: [:index]
end

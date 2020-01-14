Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    }
    devise_scope :user do
      get 'profiles', to: 'users/registrations#new_phone'
      get 'addresses', to: 'users/registrations#new_address'
      post 'addresses', to: 'users/registrations#create_address'
    end
  root "home#top"
  resources :users, only: [:index]
  resources :products, only: [:index, :show]
end
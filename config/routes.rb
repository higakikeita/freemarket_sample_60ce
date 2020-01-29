Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
    }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    get 'creditcards', to: 'users/registrations#new_creditcard'
    post 'creditcards', to: 'users/registrations#create_creditcard'
  end
  root "home#top"
  resources :users, only: [:index]
  resources :products, only: [:index, :show, :new, :create, :edit, :destroy] do
    resources :comments, only:[:create, :destroy]
  end
  resources :registration, only: [:index]
end

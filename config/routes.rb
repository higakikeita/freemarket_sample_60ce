Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    }
  devise_scope :user do
    get 'sms_authentications', to: 'users/registrations#create_sms_authentication'
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    get 'credit_cards', to: 'users/registrations#new_credit_card'
    post 'credit_cards', to: 'users/registrations#create_credit_card'
  end
  root "home#top"
  resources :users, only: [:index]
  resources :products, only: [:index, :show,:new,:create]
  resources :registration, only: [:index]
end

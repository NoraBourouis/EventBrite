Rails.application.routes.draw do
  devise_for :users
  resources :home, only: [:index, :secret]
  resources :events, only: [:index, :new, :show, :create]
  resources :users, only: [:show]
  root 'events#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

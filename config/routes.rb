Rails.application.routes.draw do
  devise_for :users
  resources :events do
    resources :participations, only: [:new, :index, :create]
  end
  resources :users, only: [:show, :edit, :update]

  root 'events#index'
end

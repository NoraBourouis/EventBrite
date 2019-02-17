Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :attendances
      resources :events
      root to: "users#index"
    end

  devise_for :users
  resources :events do
    resources :participations, only: [:new, :index, :create]
    resources :event_pictures, only: [:create]
  end
  resources :users, only: [:show, :edit, :update] do
    resources :avatars, only: [:create]
  end

  root 'events#index'
end

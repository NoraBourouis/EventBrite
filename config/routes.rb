Rails.application.routes.draw do
  devise_for :users
  resources :home, only: [:index, :secret]
  resources :events, only: [:index, :new, :show, :create, :edit] do
    resources :participations, only: [:new, :index, :create]
  end
  resources :users, only: [:show]
  post "/events/:event_id/participations/:id", to: "participations#create", as: "event_participation"
  root 'events#index'
end

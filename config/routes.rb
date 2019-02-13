Rails.application.routes.draw do
  devise_for :users
  resources :events do
    resources :participations, only: [:new, :index, :create]
  end
  resources :users, only: [:show, :edit, :update]
  post "/events/:event_id/participations/:id", to: "participations#create", as: "event_participation"
  delete "/events/:id/", to: "events#destroy", as: "destroy_event"
  root 'events#index'
end

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations", omniauth_callbacks: "omniauth_callbacks" }
  get "users/profile", to: "users#show"
  root "homes#top"
  get "home", to: "homes#home"
  namespace :account do
    resource :password, only: %i[edit update]
  end
  resources :foods, only: %i[new create edit update destroy] do
    member do
      delete :delete_food_image
    end
    collection do
      get :autocomplete
      get :favorites
    end
  end
  resources :favorites, only: %i[create destroy]
  resources :user_foods, only: %i[index new create edit update destroy]
  namespace :food_actions do
    resource :consume, only: %i[new create]
    resource :discard, only: %i[new create]
  end
  resources :food_actions, only: %i[index] do
    collection do
      get :history
      get :rankings
    end
  end
  resource :reminder, only: %i[show new create edit update destroy]
  get "character_stage", to: "user_characters#character_stage"
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end

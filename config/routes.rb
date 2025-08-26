Rails.application.routes.draw do
  get "look_ups/new"
  resources :creators, only: %i[ show ]
  resources :recipes do
    resources :sources, only: %i[show new create edit update destroy  ]
  end
  resources :shuffles, only: %i[index show new create] do
    resources :shuffle_recipes, only: %i[index show update]
  end
  resources :sources, only: %i[show new create edit ]

  get "look_up/", to: "look_ups#new", as: :retrieve
  post "look_up/", to: "look_ups#create"

  # Authentication
  resource :session
  resources :passwords, param: :token
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "recipes#index"
end

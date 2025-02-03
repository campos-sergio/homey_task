Rails.application.routes.draw do
  root "projects#index"

  get "up" => "rails/health#show", as: :rails_health_check
  get "signup", to: "users#new"
  post "signup", to: "users#create"

  resource :session
  resources :passwords, param: :token
  resources :projects do
    resources :comments, only: [ :create ]
  end
end

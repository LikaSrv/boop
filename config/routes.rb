Rails.application.routes.draw do
  devise_for :users
  root to: "professionals#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :professionals do
    member do
      get 'appointments', to: 'appointments#pro_show', as: :pro_show
    end
    resources :appointments, only: [:new, :create, :show, :index]
    resources :reviews, only: [:new, :create]
  end
  resources :users, only: [:show] do
    member do
      get 'professionals', to: 'professionals#pro_index', as: :pro_index
      # get 'professionals', to: 'professionals#pro_show', as: :pro_show
    end
  end
end

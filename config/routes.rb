Rails.application.routes.draw do
  root "homepages#index"

  resources :homepages, only: :index do
    collection do
      get :administrators
      get :cities
      get :clients_subscriptions
      get :clients
      get :orders
      get :reviews
      get :scooters_in_work
      get :scooters
      get :subscriptions
      get :transactions
    end
  end

  resources :administrators
  resources :clients
  resources :subscriptions
  resources :scooters
  resources :cities
end

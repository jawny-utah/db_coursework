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

  resources :requests, only: :index do
    collection do
      get :get_request
      get :between_request
      get :in_request
      get :like_request
      get :two_condition_with_and_request
      get :two_condition_with_or_request
      get :distinct_request
      get :max_request
      get :sum_request
      get :count_request
      get :count_and_other_fields_request
      get :inner_join_with_condition_request
      get :inner_request_with_condition
      get :left_join_request
      get :right_join_request
      get :inner_join_with_aggregate_and_having_request
      get :exist_request
      get :any_request
      get :inner_join_in_subquery_request
      get :aggregate_function_with_condition_and_ordering_request
    end
  end

  resources :administrators
  resources :clients
  resources :subscriptions
  resources :scooters
  resources :cities
  resources :transactions
  resources :client_subscriptions
  resources :orders
  resources :scooter_in_works
  resources :reviews
end

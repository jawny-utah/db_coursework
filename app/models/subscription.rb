class Subscription < ApplicationRecord
  has_many :client_subscriptions, dependent: :nullify
end

class Client < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_one :client_subscription, dependent: :destroy
end

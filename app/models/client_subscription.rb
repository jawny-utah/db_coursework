class ClientSubscription < ApplicationRecord
  belongs_to :client
  belongs_to :subscription
end

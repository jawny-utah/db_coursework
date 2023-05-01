class Order < ApplicationRecord
  belongs_to :scooter_in_work
  belongs_to :client
end

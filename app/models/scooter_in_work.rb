class ScooterInWork < ApplicationRecord
  belongs_to :scooter
  belongs_to :city

  delegate :price_per_minute, to: :scooter
end

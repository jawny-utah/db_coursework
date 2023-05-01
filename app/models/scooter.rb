class Scooter < ApplicationRecord
  has_many :scooter_in_works, dependent: :nullify
end

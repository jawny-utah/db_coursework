class Transaction < ApplicationRecord
  belongs_to :order

  enum status: %i(created in_progress finished error)
end

class Client < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_one :client_subscription, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}"
  end
end

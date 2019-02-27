class Service < ApplicationRecord
  belongs_to :car
  belongs_to :user

  monetize :final_price_cents
end

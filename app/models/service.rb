class Service < ApplicationRecord
  belongs_to :car
  belongs_to :user
  belongs_to :beneficiary

  monetize :final_price_cents
end

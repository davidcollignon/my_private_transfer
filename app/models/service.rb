class Service < ApplicationRecord
  belongs_to :car
  belongs_to :user
  # belongs_to :beneficiary, optional: true

  # validates :pick_up_date, presence: true

  monetize :final_price_cents
end

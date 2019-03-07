class Service < ApplicationRecord
  belongs_to :car
  belongs_to :user
  # belongs_to :beneficiary, optional: true
  validates :number_of_passengers, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :commission_rate, inclusion: { in: 0..100, message: "cannot be negative"}

  monetize :final_price_cents
end

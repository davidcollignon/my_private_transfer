class Service < ApplicationRecord
  belongs_to :car
  belongs_to :user
  # belongs_to :beneficiary, optional: true

  # validates :pick_up_date, presence: true
  validates :number_of_passengers, presence: true
  validates :number_normal_luggage, presence: true
  validates :number_hand_luggage, presence: true
  validates :number_odd_luggage, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  monetize :final_price_cents
end

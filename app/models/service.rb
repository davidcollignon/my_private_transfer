class Service < ApplicationRecord
  belongs_to :car
  belongs_to :user
  belongs_to :beneficiary

  validates :pick_up_date, presence: true
end

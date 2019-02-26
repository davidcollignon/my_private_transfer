class Beneficiary < ApplicationRecord
  has_many :services

  validates :first_name, presence: true
  validates :last_name, presence: true


end

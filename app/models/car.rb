class Car < ApplicationRecord
  has_many :services
  belongs_to :company
end

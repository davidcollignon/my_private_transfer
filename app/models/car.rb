class Car < ApplicationRecord
  has_many :services
  belongs_to :company

  mount_uploader :image, PhotoUploader
  monetize :price_per_hour_cents
  monetize :price_per_km_cents
end

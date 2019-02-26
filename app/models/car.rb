class Car < ApplicationRecord
  belongs_to :company

  mount_uploader :image, PhotoUploader
end

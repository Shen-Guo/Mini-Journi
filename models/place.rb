class ImageUploader < CarrierWave::Uploader::Base
  storage :file
end

class Place < ActiveRecord::Base
  belongs_to :journey
  mount_uploader :image, ImageUploader
end
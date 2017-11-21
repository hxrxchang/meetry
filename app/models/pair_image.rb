class PairImage < ApplicationRecord
  has_one :connect_history
  mount_uploader :image, ImageUploader
end

class ConnectHistory < ApplicationRecord
  belongs_to :user
  has_one :pair_image
end

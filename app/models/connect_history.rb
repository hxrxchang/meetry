class ConnectHistory < ApplicationRecord
  belongs_to :own_user, class_name: "User", foreign_key: :own_user_id
  belongs_to :yours_user, class_name: "User", foreign_key: :yours_user_id
  belongs_to :pair_image
end

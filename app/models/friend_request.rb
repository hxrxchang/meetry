class FriendRequest < ApplicationRecord
  belongs_to :friend, class_name: "User"
  belongs_to :request_user, class_name: "User"
  enum request_status: { yet: 0, accept: 1, refuse: 2 }

  validates :friend_id, uniqueness: { scope: [:request_user_id] }
end

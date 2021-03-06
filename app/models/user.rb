class User < ApplicationRecord
  has_one :user_information
  has_many :social_accounts
  # has_many :connect_histories, foreign_key: :own_user_id
  # has_many :friends, through: :connect_histories, class_name: "User", foreign_key: :yours_user_id, source: "yours_user"
  has_many :friend_requests, foreign_key: :friend_id
  has_many :request_users, through: :friend_requests, foreign_key: :request_user_id

  validates :uuid, uniqueness: true

  def self.find_from_token(token)
    return nil unless token
    verifier = Rails.application.message_verifier(:registration_user)
    return nil unless verifier.valid_message?(token)
    id, registrated_at = verifier.verify(token)
    return nil if registrated_at < 1.day.ago
    User.find_by(id: id)
  end

  def verifier_token
    verifier = Rails.application.message_verifier(:registration_user)
    verifier.generate([id, Time.zone.now])
  end

  def send_email
    UserMailer.account_activation(self, verifier_token).deliver_now
  end

  def self.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end
end

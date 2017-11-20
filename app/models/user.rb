class User < ApplicationRecord
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
end

class User < ApplicationRecord
  has_secure_password
  before_create :generate_confirmation_instructions
  def generate_confirmation_instructions
    self.confirmation_token = SecureRandom.hex(10)
    self.confirmation_sent_at = Time.current
  end

  def confirm_email
    self.confirmed_at = Time.current
    self.confirmation_token = nil
    save!
  end
  def confirmed?
    confirmed_at.present?
  end
  validates :email, uniqueness: true

  # validates :username, uniqueness: true, presence: true
end

class User < ApplicationRecord
  has_secure_password
  after_create :send_confirmation_email
  before_create :generate_confirmation_token
  belongs_to :role

  def send_confirmation_email
    UserMailer.with(user: self).confirmation_email.deliver_now
  end

  def confirm_email
    update(confirmed_at: Time.current)
  end

  validates :email, uniqueness: true

  private

  def generate_confirmation_token
    self.confirmation_token = SecureRandom.urlsafe_base64.to_s
  end
end

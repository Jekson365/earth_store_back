class User < ApplicationRecord
  has_secure_password
  has_secure_token :api_key
  validates :email, uniqueness: true

  belongs_to :cart
  # validates :username, uniqueness: true, presence: true
end

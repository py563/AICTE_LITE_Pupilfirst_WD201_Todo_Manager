class User < ApplicationRecord
  validates :email, presence: true
  validates :first_name, length: { minimum: 2 }
  has_secure_password
  has_many :todos

  def to_pleasant_string
    "Welcome #{first_name}"
  end
end

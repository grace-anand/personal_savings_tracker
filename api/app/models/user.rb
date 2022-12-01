class User < ApplicationRecord

  has_secure_password

  validates :email, uniqueness: true, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :age, presence: true
  validates :username, presence: true
  validates :password, length: { minimum: 6 }, presence: true

end


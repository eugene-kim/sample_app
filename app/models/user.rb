class User < ActiveRecord::Base
  attr_accessible :name, :email, :string, :password, :password_confirmation
  has_secure_password

  before_save { email.downcase! }

  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A([\w+\-.+]+)@[a-z0-9\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX},
            uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

end
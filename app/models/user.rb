class User < ApplicationRecord
  has_secure_password
  has_many :products
  has_many :purchases
  has_many :product_buy, through: :purchases, source: :product
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true, length: { in: 2..20 }
  validates :email, presence: true, uniqueness: true, format: { with: EMAIL_REGEX }
end

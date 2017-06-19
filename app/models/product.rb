class Product < ApplicationRecord
  belongs_to :user
  has_many :purchases
  has_many :customers, through: :purchases, source: :user
  validates :name, :amount, presence: true
end

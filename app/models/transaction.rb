class Transaction < ApplicationRecord
  belongs_to :user
  has_many :transaction_categories, dependent: :destroy
  has_many :categories, through: :transaction_categories

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :name, presence: true, length: { maximum: 30 }
end

class Category < ApplicationRecord
  belongs_to :user
  has_many :transaction_categories, dependent: :destroy
  has_many :transactions, through: :transaction_categories
  has_one_attached :avatar

  validates :name, presence: true, length: { maximum: 30 }
end

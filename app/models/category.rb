class Category < ApplicationRecord
  belongs_to :user
  has_many :transaction_categories, dependent: :destroy
  has_many :transaction_entities, through: :transaction_categories
  has_one_attached :icon

  validates :name, presence: true, length: { maximum: 30 }
end

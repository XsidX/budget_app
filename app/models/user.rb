class User < ApplicationRecord
  has_many :categories, dependent: :destroy
  has_many :transactions, dependent: :destroy
  has_one_attached :avatar

  validates :name, presence: true, length: { maximum: 30 }
end

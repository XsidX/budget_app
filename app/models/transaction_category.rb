class TransactionCategory < ApplicationRecord
  belongs_to :transaction_entity
  belongs_to :category

  validates :transaction_entity_id, presence: true
  validates :category_id, presence: true
end

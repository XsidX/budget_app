class TransactionCategory < ApplicationRecord
  belongs_to :transaction
  belongs_to :category

  validates :transaction_id, presence: true
  validates :category_id, presence: true

end

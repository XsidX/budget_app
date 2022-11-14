require 'rails_helper'

RSpec.describe TransactionCategory, type: :model do
  context 'associations' do
    it('belongs to a transaction') do
      transaction_category = TransactionCategory.reflect_on_association(:transaction)
      association = transaction_category.macro
      expect(association).to eq(:belongs_to)
    end

    it('belongs to a category') do
      transaction_category = TransactionCategory.reflect_on_association(:category)
      association = transaction_category.macro
      expect(association).to eq(:belongs_to)
    end
  end
end

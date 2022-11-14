require 'rails_helper'

RSpec.describe Transaction, type: :model do
  context 'associations' do
    it('belongs to a user') do
      transaction = Transaction.reflect_on_association(:user)
      association = transaction.macro
      expect(association).to eq(:belongs_to)
    end

    it('has many categories') do
      transaction = Transaction.reflect_on_association(:categories)
      association = transaction.macro
      expect(association).to eq(:has_many)
    end
  end

  context 'validations' do
    it('is invalid without a name') do
      transaction = Transaction.new(name: nil)
      expect(transaction).to_not be_valid
    end

    it('is invalid with a name longer than 30 characters') do
      transaction = Transaction.new(name: 'a' * 31)
      expect(transaction).to_not be_valid
    end

    it('is invalid without an amount') do
      transaction = Transaction.new(amount: nil)
      expect(transaction).to_not be_valid
    end

    it('is invalid with an amount less than 0') do
      transaction = Transaction.new(amount: -1)
      expect(transaction).to_not be_valid
    end
  end
end

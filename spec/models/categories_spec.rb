require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'associations' do
    it('belongs to a user') do
      category = Category.reflect_on_association(:user)
      association = category.macro
      expect(association).to eq(:belongs_to)
    end

    it('has many transaction_entities') do
      category = Category.reflect_on_association(:transaction_entities)
      association = category.macro
      expect(association).to eq(:has_many)
    end
  end

  context 'validations' do
    it('is invalid without a name') do
      category = Category.new(name: nil)
      expect(category).to_not be_valid
    end

    it('is invalid with a name longer than 30 characters') do
      category = Category.new(name: 'a' * 31)
      expect(category).to_not be_valid
    end
  end
end

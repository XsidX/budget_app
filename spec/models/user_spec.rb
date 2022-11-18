require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it('has many categories') do
      user = User.reflect_on_association(:categories)
      association = user.macro
      expect(association).to eq(:has_many)
    end

    it('has many transaction_entities') do
      user = User.reflect_on_association(:transaction_entities)
      association = user.macro
      expect(association).to eq(:has_many)
    end
  end

  context 'validations' do
    it('is invalid without a name') do
      user = User.new(name: nil)
      expect(user).to_not be_valid
    end

    it('is invalid with a name longer than 30 characters') do
      user = User.new(name: 'a' * 31)
      expect(user).to_not be_valid
    end
  end
end

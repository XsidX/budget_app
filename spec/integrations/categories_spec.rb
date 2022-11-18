require 'rails_helper'

RSpec.describe 'Categories', type: :system, js: true do
  describe '#categories index' do
    before(:example) do
      @user = User.create(name: 'testUser', email: 'test@budgetapp.com', password: 'password')
      sign_in @user

      @category = Category.create(name: 'Test Category', user: @user)
      @transaction_entity1 = TransactionEntity.create(name: 'Test Transaction', amount: 100, user: @user)
      @transaction_entity2 = TransactionEntity.create(name: 'Test Transaction 2', amount: 200, user: @user)
      TransactionCategory.create(category: @category, transaction_entity: @transaction_entity1)
      TransactionCategory.create(category: @category, transaction_entity: @transaction_entity2)
      visit categories_path
    end

    it 'displays the category name' do
      expect(page).to have_content(@category.name)
    end

    it 'displays the category total' do
      total = @transaction_entity1.amount + @transaction_entity2.amount
      expect(page).to have_content(total)
    end
  end

  describe '#categories show' do
    before(:example) do
      @user = User.create(name: 'testUser', email: 'test@budgetapp.com', password: 'password')
      sign_in @user

      @category = Category.create(name: 'Test Category', user: @user)
      @transaction_entity1 = TransactionEntity.create(name: 'Test Transaction', amount: 100, user: @user)
      @transaction_entity2 = TransactionEntity.create(name: 'Test Transaction 2', amount: 200, user: @user)
      TransactionCategory.create(category: @category, transaction_entity: @transaction_entity1)
      TransactionCategory.create(category: @category, transaction_entity: @transaction_entity2)
      visit category_path(@category)
    end

    it 'displays the category name' do
      expect(page).to have_content(@category.name)
    end

    it 'displays the transaction name' do
      expect(page).to have_content(@transaction_entity1.name)
      expect(page).to have_content(@transaction_entity2.name)
    end

    it 'displays the transaction amount' do
      expect(page).to have_content(@transaction_entity1.amount)
      expect(page).to have_content(@transaction_entity2.amount)
    end

    it 'displays the category total' do
      total = @transaction_entity1.amount + @transaction_entity2.amount
      expect(page).to have_content(total)
    end
  end
end

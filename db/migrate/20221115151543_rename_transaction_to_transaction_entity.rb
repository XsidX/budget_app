class RenameTransactionToTransactionEntity < ActiveRecord::Migration[7.0]
  def change
    rename_table :transactions, :transaction_entities
  end
end

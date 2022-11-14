class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false, limit: 30
      t.decimal :amount, null: false, precision: 10, scale: 2
      t.timestamps
    end
  end
end

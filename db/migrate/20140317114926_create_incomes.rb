class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.integer :amount
      t.text :note
      t.references :income_type, index: true

      t.timestamps
    end
  end
end

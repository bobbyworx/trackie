class CreateExpenseTypes < ActiveRecord::Migration
  def change
    create_table :expense_types do |t|
      t.string :name
      t.references :parent_expense_type, index: true

      t.timestamps
    end
  end
end

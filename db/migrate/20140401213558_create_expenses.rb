class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer :amount
      t.string :note
      t.references :expense_type, index: true

      t.timestamps
    end
  end
end

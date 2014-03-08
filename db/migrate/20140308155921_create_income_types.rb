class CreateIncomeTypes < ActiveRecord::Migration
  def change
    create_table :income_types do |t|
      t.string :name
      t.references :parent_income_type, index: true

      t.timestamps
    end
  end
end

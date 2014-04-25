class AddUserIdToExpenseType < ActiveRecord::Migration
  def change
    add_column :expense_types, :user_id, :integer
  end
end

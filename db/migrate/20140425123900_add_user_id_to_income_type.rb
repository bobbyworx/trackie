class AddUserIdToIncomeType < ActiveRecord::Migration
  def change
    add_column :income_types, :user_id, :integer
  end
end

class ExpenseType < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 50}, :uniqueness => true

  has_many :child_expense_types, :class_name => "ExpenseType",
                  :foreign_key => "parent_expense_type_id", dependent: :delete_all
  belongs_to :parent_expense_type, :class_name => "ExpenseType"

end

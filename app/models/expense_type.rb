class ExpenseType < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 50}, :uniqueness => true
  validate :name_different_from_parent

  has_paper_trail
  has_many :child_expense_types, :class_name => "ExpenseType",
                  :foreign_key => "parent_expense_type_id", dependent: :delete_all
  belongs_to :parent_expense_type, :class_name => "ExpenseType"

  def name_different_from_parent
    if self.id == self.parent_expense_type_id
      errors.add(:expense_type, "name has to be different from parent's name!")
    end
  end

  def extended
  self.child_expense_types.to_a << self
  #[self] << self.child_income_types.to_a
  end

end

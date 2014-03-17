class IncomeType < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 50}, :uniqueness => true

  has_many :child_income_types, :class_name => "IncomeType",
                  :foreign_key => "parent_income_type_id", dependent: :delete_all
  belongs_to :parent_income_type, :class_name => "IncomeType"

  has_many :incomes
 
end

class IncomeType < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 50}, :uniqueness => true
  validate :name_different_from_parent

  has_many :child_income_types, :class_name => "IncomeType",
                  :foreign_key => "parent_income_type_id", dependent: :delete_all
  belongs_to :parent_income_type, :class_name => "IncomeType"

  has_many :incomes
  has_paper_trail

def name_different_from_parent
    if self.name == self.parent_income_type.name
      errors.add(:income_type, "name has to be different from parent's name!")
    end
end

def extended
self.child_income_types.to_a << self
#[self] << self.child_income_types.to_a
end
 
end

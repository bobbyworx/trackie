class IncomeType < ActiveRecord::Base
  validates :name, presence: true, :uniqueness => true
  has_many :child_income_types, :class_name => "IncomeType",
                  :foreign_key => "parent_income_type_id"
  belongs_to :parent_income_type, :class_name => "IncomeType", 
                   :foreign_key => "parent_income_type_id"
  #attr_accessible :name, :parent_income_type_id
 
end

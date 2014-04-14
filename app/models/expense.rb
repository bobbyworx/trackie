class Expense < ActiveRecord::Base
  belongs_to :expense_type
  has_paper_trail
  validates :amount, :presence => {:message => "Please write the amount of money spent", numericality: true}
  validates :note, presence: true
end

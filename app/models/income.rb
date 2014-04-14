class Income < ActiveRecord::Base
  belongs_to :income_type
  has_paper_trail
  validates :amount, :presence => {:message => "Please write the amount of money earned", numericality: true}
  validates :note, presence: true
end

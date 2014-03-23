class Income < ActiveRecord::Base
  belongs_to :income_type
  has_paper_trail
  validates :amount, presence: true, numericality: true
  validates :note, presence: true
end

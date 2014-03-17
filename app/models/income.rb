class Income < ActiveRecord::Base
  belongs_to :income_type
  validates :amount, presence: true, numericality: true
  validates :note, presence: true
end

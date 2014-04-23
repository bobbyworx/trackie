class DashboardController < ApplicationController
  helper_method :balance

  def index
  end
  
  def balance
    Income.where("created_at BETWEEN ? AND ?", DateTime.now.beginning_of_month, DateTime.now).sum(:amount) -
    Expense.where("created_at BETWEEN ? AND ?", DateTime.now.beginning_of_month, DateTime.now).sum(:amount)
  end
  
end

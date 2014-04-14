module Balance
  
  def total_income
    Income.where("created_at BETWEEN ? AND ?", DateTime.now.beginning_of_month, DateTime.now).sum(:amount)
  end

  def total_expense
    Expense.where("created_at BETWEEN ? AND ?", DateTime.now.beginning_of_month, DateTime.now).sum(:amount)
  end

end

class DashboardController < ApplicationController
  helper_method :balance
  helper_method :see_if_users_accepted_invitation

  def index
  end
  
  def balance
    Income.where("created_at BETWEEN ? AND ?", DateTime.now.beginning_of_month, DateTime.now).sum(:amount) -
    Expense.where("created_at BETWEEN ? AND ?", DateTime.now.beginning_of_month, DateTime.now).sum(:amount)
  end

  def see_if_users_accepted_invitation
    user = User.find(2)
    user.invitation_accepted?
  end
  
end

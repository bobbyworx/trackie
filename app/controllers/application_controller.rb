class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  before_action :authenticate_user!
  helper :all

  def total_expense
    Expense.where("created_at BETWEEN ? AND ?", DateTime.now.beginning_of_month, DateTime.now).sum(:amount)
  end

  def total_income
    Income.where("created_at BETWEEN ? AND ?", DateTime.now.beginning_of_month, DateTime.now).sum(:amount)
  end

  #def after_sign_in_path_for(resource)
    #request.env['omniauth.origin'] || root_url
  #end
  
end

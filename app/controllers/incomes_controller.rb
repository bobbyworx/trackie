class IncomesController < ApplicationController

  helper_method :income

def new
  @income = Income.new
end

def create
  @income_type = IncomeType.find(params[:income][:income_type_id])
  @income = @income_type.incomes.create(resource_params)
  if @income.save
    flash[:notice] = "You added #{@income.amount} to your Income this month!"
    redirect_to incomes_path
  else
    render :new
  end
end

def index 
  @incomes = Income.page(params[:page]).per(5)
end

def resource_params
  params.require(:income).permit(:income_type_id, :amount, :note)
end

end

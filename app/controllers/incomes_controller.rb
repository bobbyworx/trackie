class IncomesController < ApplicationController
  respond_to :html, :json
  helper_method :income
  helper_method :resource_params

def new
  @income = Income.new
end

def create
  #@income_type = IncomeType.find(params[:income][:income_type_id])
  #@income = @income_type.incomes.create(resource_params)
  
  @income = Income.new(resource_params)

  if @income.save
    flash[:notice] = "You added #{@income.amount} to your #{@income.income_type.name} this month!"
    redirect_to incomes_path
  else
    render :new
  end
end
  

def edit
  income = Income.find(params[:id])
end

def update
  if @income.update(resource_params)
      redirect_to incomes_path
    else
      render 'edit'
  end
end

def index 
  @incomes = Income.page(params[:page]).per(5).order('created_at DESC')
end

def destroy
    @income = Income.find(params[:id])
    @income.destroy
    redirect_to incomes_path
end

def resource_params
  params.require(:income).permit(:income_type_id, :amount, :note)
end

end

class ExpensesController < ApplicationController
  helper_method :resource_params
  helper_method :total_expense

def new
  @expense = Expense.new
end

def create
  #@income_type = IncomeType.find(params[:income][:income_type_id])
  #@income = @income_type.incomes.create(resource_params)
  
  @expense = Expense.new(resource_params)

  if @expense.save
    flash[:notice] = "You added #{@expense.amount} to your #{@expense.expense_type.try(:name)} this month!"
    redirect_to expenses_path
  else
    render :new
  end
end
  
def edit
  @expense = Expense.find(params[:id])
end

def update
  @expense = Expense.find(params[:id])
  if @expense.update(resource_params)
      redirect_to expenses_path
      flash[:notice] = "Expense updated! #{undo_link}"
    else
      render 'edit'
  end
end
        
def index 
  @expenses = Expense.page(params[:page]).per(5).order('created_at DESC')
end

def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    flash[:notice] = "Income #{@expense.amount.to_s} is deleted! Press #{undo_link} to add it back!"
    redirect_to expenses_path
end

private

def resource_params
  params.require(:expense).permit(:expense_type_id, :amount, :note)
end

def undo_link
  undo_link = view_context.link_to("undo", revert_version_path(@expense.versions.scoped.last, :method => :post))
end

end



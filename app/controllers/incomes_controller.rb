class IncomesController < ApplicationController
  respond_to :html, :json
  helper_method :resource_params
  helper_method :total_income

def new
  @income = Income.new
end

def create
  #@income_type = IncomeType.find(params[:income][:income_type_id])
  #@income = @income_type.incomes.create(resource_params)
  
  @income = Income.new(resource_params)

  if @income.save
    flash[:notice] = "You added #{@income.amount} to your #{@income.income_type.try(:name)} this month!"
    redirect_to incomes_path
  else
    render :new
  end
end
  
def edit
  @income = Income.find(params[:id])
end

def update
  @income = Income.find(params[:id])
  if @income.update(resource_params)
      redirect_to incomes_path
      flash[:notice] = "Income updated! #{undo_link}"
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
    respond_to do |format|
      format.html { redirect_to incomes_url }
      format.json { head :no_content }
      format.js   { render :nothing => true }
    end
    #flash[:notice] = "Income #{@income.amount.to_s} is deleted! Press #{undo_link} to add it back!"
    #redirect_to incomes_path
end

private

def resource_params
  params.require(:income).permit(:income_type_id, :amount, :note)
end

end



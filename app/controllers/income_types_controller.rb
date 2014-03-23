class IncomeTypesController < ApplicationController

  helper_method :nil_parent_income_type

  def new
    @income_type = IncomeType.new
  end

  def create
    @income_type = IncomeType.new(income_type_params)
    if @income_type.save
      flash[:notice] = "You have successfully created an income type!"
      redirect_to action: 'index' 
    else
      render 'new'
    end
  end

  def index
    @income_types = IncomeType.page(params[:page]).per(5)#paginate :per_page => 5, :page => params[:page]
  end

  #def show
  #end

  def edit
    income_type
  end

  def update
    income_type
    if @income_type.update(income_type_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    income_type
    income_type.destroy
    flash[:notice] = "You have successfully deleted #{income_type.name} income type."
    redirect_to income_types_path
  end

  def income_type_params
    params.require(:income_type).permit(:name, :parent_income_type_id)
  end

  def income_type
     @income_type ||= IncomeType.find(params[:id])
  end

private

  def nil_parent_income_type
      @unassigned_parrent = IncomeType.where(parent_income_type_id: nil)
  end


end
class IncomeTypesController < ApplicationController
  
  def new
    @income_type = IncomeType.new
  end

  def create
    @income_type = IncomeType.new(params[:income_type])
    if @income_type.save
      redirect_to action: 'index', notice: "You have successfully created an income type!"
    else
      render 'new'
    end
  end

  def index
    @income_types = IncomeType.all
  end

  #def show
  #end

  def edit
    income_type
  end

  def update
    income_type
     if @income_type.update(params[:income_type])
      redirect_to @income_type
    else
      render 'edit'
    end
  end

  def destroy
    income_type
    income_type.destroy
    redirect_to income_types_path, :notice => "Income type deleted!" 

  end

  def income_type
     @income_type ||= IncomeType.find(params[:id])
  end

  #def to_s
    #income_type.parent_income_type
  #end

end

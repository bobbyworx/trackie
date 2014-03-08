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
    @income_type = IncomeType.all
  end

  #def show
  #end

  def edit
    @income_type = IncomeType.find(params[:id])
  end

  def update
    @income_type = IncomeType.find(params[:id])
     if @income_type.update(params[:income_type])
      redirect_to @income_type
    else
      render 'edit'
    end
  end

  def delete
  end

end

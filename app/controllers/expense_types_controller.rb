class ExpenseTypesController < ApplicationController

  def new
    @expense_type = ExpenseType.new
  end

  def create
    @expense_type = ExpenseType.new(expense_type_params)
    @expense_type.user_id = current_user.id
    if @expense_type.save
      flash[:notice] = "You have successfully created an expense type!"
      redirect_to action: 'index' 
    else
      render 'new'
    end
  end

  def index
    @expense_types = ExpenseType.page(params[:page]).per(5).order('created_at DESC')#paginate :per_page => 5, :page => params[:page]
  end

  #def show
  #end

  def edit
    expense_type
  end

  def update
    expense_type
    if @expense_type.update(expense_type_params)
      flash[:notice] = "Expense Type #{expense_type.name} was saved! #{undo_link} this!"
      redirect_to action: 'index' 
    else
      render 'edit'
    end
  end

  def destroy
    expense_type
    expense_type.destroy
    flash[:notice] = "You have successfully deleted #{expense_type.name} expense type. Press #{undo_link} to add it back!"
    redirect_to expense_types_path
  end

private

  def expense_type_params
    params.require(:expense_type).permit(:user_id, :name, :parent_expense_type_id)
  end

  def expense_type
     @expense_type ||= ExpenseType.find(params[:id])
  end

  def undo_link
    undo_link = view_context.link_to("undo", revert_version_path(@expense_type.versions.scoped.last, :method => :post))
  end

end

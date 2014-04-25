class IncomeTypesController < ApplicationController

respond_to :html, :js
  helper_method :nil_parent_income_type
  helper_method :income_type_params
  def new
    @income_type = IncomeType.new
  end
  
  def create
    @income_type = IncomeType.new(income_type_params)
    @income_type.user_id = current_user.id
    if @income_type.save
      flash[:notice] = "Income Type #{income_type.name} was successfully created!"
      redirect_to action: 'index' 
    else
      render 'new'
    end
  end

  def index
    @income_types = IncomeType.page(params[:page]).per(5).order('created_at DESC')#paginate :per_page => 5, :page => params[:page]
  end

  #def show
  #end

  def edit
    income_type
  end

  def update
    income_type
    if @income_type.update(income_type_params)
      flash[:notice] = "Income Type #{income_type.name} updated! #{undo_link} this!"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    income_type
    income_type.destroy
    respond_to do |format|
      format.html { redirect_to(income_types_path) }
      format.js   { render :nothing => true }
    #flash[:notice] = "You have successfully deleted #{income_type.name} income type. Press #{undo_link} to add it back!"
    #redirect_to income_types_path
    end
  end

  def income_type_params
    params.require(:income_type).permit(:user_id, :name, :parent_income_type_id)
  end

  def income_type
     @income_type ||= IncomeType.find(params[:id])
  end

private

  def nil_parent_income_type
      @unassigned_parrent = IncomeType.where(parent_income_type_id: nil).includes(:child_income_types)
  end
  
  def undo_link
    undo_link = view_context.link_to("undo", revert_version_path(@income_type.versions.scoped.last, :method => :post))
  end

end
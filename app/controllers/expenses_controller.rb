class ExpensesController < ApplicationController
before_action :find_expense, only: [:show, :edit, :update, :destroy]

  def index
    # going to pass through a category hash - if it's blank everything 
    if params[:category].blank?
      @expenses = Expense.all.order("created_at DESC")
    else 
    # if the hash has a specific id, we're going to only show those expenses
      @category_id = Category.find_by(name: params[:category]).id
      @expenses = Expense.where(category_id: @category_id).order("created_at DESC")
    end 
  end 

  def show
  end 
  
  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expenses_params)
    @expense.user_id = current_user.id

    if @expense.save 
      redirect_to @expense
    else 
      render "New"
    end 
  end

  def edit
    
  end

  def update
    if @expense.update(expenses_params)
      redirect_to @expense
    else 
      render "Edit"
    end 
    
  end

  def destroy
    @expense.destroy
    redirect_to root_path
  end

  private

  def expenses_params
    params.require(:expense).permit(:title, :amount, :category_id, :user_id)
  end 

  def find_expense
    @expense = Expense.find(params[:id])
  end
end

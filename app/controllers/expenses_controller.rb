class ExpensesController < ApplicationController
before_action :find_expense, only: [:show, :edit, :update, :destroy]

  def index
    @expenses = Expense.all.order("created_at DESC")
  end 

  def show
  end 

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expenses_params)

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
    params.require(:expense).permit(:title, :amount, :category_id)

  end 

  def find_expense
    @expense = Expense.find(params[:id])
  end
end

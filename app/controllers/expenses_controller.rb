class ExpensesController < ApplicationController
before_action :find_expense, only: [:show, :edit, :update, :destroy]

  def index

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
    
  end

  def destroy
    
  end

  private

  def expenses_params
    params.require(:expense).permit(:title, :amount, :category)

  end 

  def find_expense
    @expense = Expense.find(params[:id])
  end
end

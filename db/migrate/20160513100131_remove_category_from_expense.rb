class RemoveCategoryFromExpense < ActiveRecord::Migration
  def change
    remove_column :expenses, :category, :string
  end
end

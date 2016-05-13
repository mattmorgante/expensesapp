class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :title
      t.decimal :amount
      t.string :category

      t.timestamps null: false
    end
  end
end

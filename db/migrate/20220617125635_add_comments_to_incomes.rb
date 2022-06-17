class AddCommentsToIncomes < ActiveRecord::Migration[7.0]
  def change
    add_column :incomes, :comment, :string
  end
end

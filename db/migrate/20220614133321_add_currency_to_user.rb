class AddCurrencyToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :currency, :string, default: "USD"
    add_column :incomes, :currency, :string, default: "USD"
    change_column :costs,:currency, :string, default: "USD"
  end
end

# frozen_string_literal: true

class CreateCosts < ActiveRecord::Migration[7.0]
  def change
    create_table :costs do |t|
      t.references :user
      t.references :category
      t.float :amount
      t.string :currency
      t.timestamps
    end
  end
end

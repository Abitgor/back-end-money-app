# frozen_string_literal: true

class CreateCostComments < ActiveRecord::Migration[7.0]
  def change
    create_table :cost_comments do |t|
      t.references :cost
      t.string :cost_description
      t.timestamps
    end
  end
end

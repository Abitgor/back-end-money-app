# frozen_string_literal: true

class AddIndexToCategories < ActiveRecord::Migration[7.0]
  def change
    add_index :categories, %i[name user_id], unique: true
  end
end

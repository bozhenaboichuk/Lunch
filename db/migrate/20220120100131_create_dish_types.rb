# frozen_string_literal: true

class CreateDishTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :dish_types do |t|
      t.string :name

      t.timestamps
    end
  end
end

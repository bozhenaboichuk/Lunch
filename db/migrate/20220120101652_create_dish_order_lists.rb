class CreateDishOrderLists < ActiveRecord::Migration[7.0]
  def change
    create_table :dish_order_lists do |t|
      t.belongs_to :order, null: false, foreign_key: true
      t.belongs_to :dish, null: false, foreign_key: true

      t.timestamps
    end
  end
end

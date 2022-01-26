class ChangeDishOrderListsToLineItems < ActiveRecord::Migration[7.0]
  def change
    rename_table :dish_order_lists, :line_items
  end
end

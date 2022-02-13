class AddSubmittedToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :submitted, :boolean, null: false, default: false
  end
end

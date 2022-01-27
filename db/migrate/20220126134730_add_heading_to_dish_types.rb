class AddHeadingToDishTypes < ActiveRecord::Migration[7.0]
  def change
    add_column :dish_types, :heading, :string
  end
end

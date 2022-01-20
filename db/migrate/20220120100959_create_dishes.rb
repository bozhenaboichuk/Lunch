class CreateDishes < ActiveRecord::Migration[7.0]
  def change
    create_table :dishes do |t|
      t.decimal :price
      t.float :weight
      t.string :name
      t.string :picture
      t.belongs_to :restaurant, null: false, foreign_key: true
      t.belongs_to :dish_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end

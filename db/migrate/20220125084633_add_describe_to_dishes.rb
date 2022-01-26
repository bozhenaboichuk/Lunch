class AddDescribeToDishes < ActiveRecord::Migration[7.0]
  def change
    add_column :dishes, :describe, :string
  end
end

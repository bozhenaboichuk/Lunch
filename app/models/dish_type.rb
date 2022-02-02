class DishType < ApplicationRecord
  has_many :dishes, dependent: :destroy
end

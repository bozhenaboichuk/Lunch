class Dish < ApplicationRecord
  belongs_to :restaurant
  belongs_to :dish_type
  has_many :dish_order_list
  has_many :orders, through: :dish_order_list
end

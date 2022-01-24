class Order < ApplicationRecord
  belongs_to :user
  has_many :dish_order_list
  has_many :dishes, through: :dish_order_list
end

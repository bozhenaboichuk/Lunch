class Restaurant < ApplicationRecord
  has_many :dishes, dependent: :destroy
  has_one_attached :avatar
end

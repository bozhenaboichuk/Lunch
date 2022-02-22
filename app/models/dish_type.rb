# frozen_string_literal: true

class DishType < ApplicationRecord
  has_many :dishes, dependent: :destroy
  has_one_attached :avatar
end

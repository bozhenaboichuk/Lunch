# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  has_many :line_items, dependent: :destroy
  has_many :dishes, through: :line_items
end

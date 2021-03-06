# frozen_string_literal: true

class Dish < ApplicationRecord
  belongs_to :restaurant
  belongs_to :dish_type
  has_many :line_items, dependent: :destroy
  has_many :orders, through: :line_items

  attr_accessor :picture

  mount_uploader :picture, DishUploader

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :name, length: { minimum: 4 }
  validates :describe, length: { minimum: 8 }, allow_blank: true

  private

  # ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    return if line_items.empty?

    errors.add(:base, 'Line Items present')
    throw :abort
  end
end

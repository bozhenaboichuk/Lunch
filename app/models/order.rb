# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  has_many :line_items, dependent: :destroy
  has_many :dishes, through: :line_items

  scope :all_or_today, lambda { |opt|
    orders = includes(:user, :line_items, :dishes).where(submitted: true)

    unless opt&.to_sym == :all
      orders.where('DATE(created_at) = ?',
                   Time.zone.now.strftime('%Y-%m-%d'))
    end
  }
end

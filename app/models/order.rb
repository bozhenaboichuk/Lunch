# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  has_many :line_items, dependent: :destroy
  has_many :dishes, through: :line_items

  scope :all_or_today, ->(opt) do
    orders = includes(:user).where(submitted: true)

    orders.where('DATE(created_at) = ?',
                 Time.now.strftime('%Y-%m-%d')) unless opt == :all
    
    orders.order(created_at: :desc)
  end
end

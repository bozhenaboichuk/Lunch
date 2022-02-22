# frozen_string_literal: true

class ChangeDefaultValueForCompleted < ActiveRecord::Migration[7.0]
  def change
    change_column_default :orders, :completed, from: nil, to: false
  end
end

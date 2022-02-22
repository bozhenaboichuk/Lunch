# frozen_string_literal: true

module CurrentOrder
  private

  def set_current_order
    session[:init] = 'true'
    @order = Order.find(session[:order_id])
  rescue ActiveRecord::RecordNotFound
    @order = Order.create user: current_user
    session[:order_id] = @order.id
  end
end

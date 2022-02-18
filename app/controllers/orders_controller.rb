# frozen_string_literal: true

class OrdersController < ApplicationController
  include CurrentOrder

  before_action :set_order!, only: %i[show destroy update]
  before_action :set_current_order, only: :create
  before_action :authorize_order

  def index
    @orders = Order.where('submitted = true').order(created_at: :desc)
  end

  def show; end

  def create
    @order = Order.find session[:order_id]
    @order.update submitted: true
    session.delete(:order_id)
    redirect_to user_orders_path(current_user), status: :see_other
  end

  def update
    if @order.completed == true
      @order.update completed: false
    else
      @order.update completed: true
    end

    redirect_to user_orders_path(current_user), status: :see_other
  end

  def destroy
    @order.destroy
    session.delete(:order_id)
    redirect_to user_orders_path(current_user), status: :see_other
  end

  private

  def authorize_order
    authorize(@order || Order)
  end

  def set_order!
    @order = Order.find params[:id]
  end
end

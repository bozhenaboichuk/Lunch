# frozen_string_literal: true

class OrdersController < ApplicationController
  include CurrentOrder

  before_action :set_order!, only: %i[show destroy update]
  before_action :set_current_order, only: :create
  before_action :authorize_order

  def index
    if params[:user_id].present?
      @orders = User.find(params[:user_id]).orders.all_or_today(params[:opt]).order(created_at: :desc)
    else
      @orders = Order.all_or_today(params[:opt]).order(created_at: :desc)
    end
  end

  def show; end

  def create
    @order = Order.find session[:order_id]
    @order.update submitted: true
    session.delete(:order_id)
    redirect_to orders_path, status: :see_other
  end

  def update
    if @order.completed == true
      @order.update completed: false
    else
      @order.update completed: true
    end

    redirect_to orders_path, status: :see_other
  end

  def destroy
    @order.destroy
    session.delete(:order_id)
    redirect_to orders_path, status: :see_other
  end

  private

  def authorize_order
    authorize(@order || Order)
  end

  def set_order!
    @order = Order.find params[:id]
  end
end

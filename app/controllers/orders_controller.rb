class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order!, only: %i[show destroy]

  def index
    @orders = Order.order(created_at: :desc)
  end
  
  def show
  end

  def create
    session.delete(:order_id)
    redirect_to root_path
  end

  def destroy
    @order.destroy
    session.delete(:order_id)
    redirect_to root_path
  end

  private

  def set_order!
    @order = Order.find params[:id]
  end
end

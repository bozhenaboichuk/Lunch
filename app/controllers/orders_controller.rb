class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order!, only: %i[show destroy update]
  before_action :authorize_order

  def index
    @orders = Order.order(created_at: :desc)
  end
  
  def show
  end

  def create
    session.delete(:order_id)
    redirect_to request.referer || root_path, status: :see_other
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

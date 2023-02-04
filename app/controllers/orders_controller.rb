# frozen_string_literal: true

class OrdersController < ApplicationController
  include CurrentOrder

  before_action :set_order!, only: %i[show destroy update]
  before_action :set_today_orders, only: :update
  before_action :set_current_order, only: :create
  before_action :authorize_order, except: :update

  def index
    if params[:user_id].present?
      @orders = User.find(params[:user_id]).orders.all_or_today(params[:opt]).order(created_at: :desc)
    else
      @orders = Order.all_or_today(params[:opt]).order(created_at: :desc)
    end
    
    orders_layout(params[:orders_layout])
  end

  def show; end

  def create
    @order = Order.find session[:order_id]
    @order.update submitted: true
    session.delete(:order_id)
    redirect_to orders_path, status: :see_other
  end

  def update
    if params[:update_orders] == 'complete_all_today'
      complete_all_today(@today_orders)
    elsif params[:update_orders] == 'uncomplete_all_today'
      uncomplete_all_today(@today_orders)
    else
      authorize(@order)
      toggle_single_order(@order)
    end

    if params[:user_id].present?
      redirect_to user_orders_path, status: :see_other
    else
      redirect_to orders_path, status: :see_other
    end
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
    @order = Order.find params[:id] if params[:id].present?
  end

  def set_today_orders
    @today_orders = Order.all_or_today('today').order(created_at: :desc)
  end

  def orders_layout(layout)
    if layout == 'table' || layout == 'cards'
      session[:orders_layout] = layout
    elsif current_user.admin_role?
      session[:orders_layout] = 'table' if session[:orders_layout] != 'table' &&
                                           session[:orders_layout] != 'cards'
    else
      session[:orders_layout] = 'cards' if session[:orders_layout] != 'table' &&
                                           session[:orders_layout] != 'cards'
    end
  end

  def toggle_single_order(order)
    if order.completed == true
      order.update completed: false
    else
      order.update completed: true
    end
  end
  
  def complete_all_today(today_orders)
    today_orders.each do |order|
      authorize(order)
      order.update(completed: true) unless order.completed == true
    end
  end

  def uncomplete_all_today(today_orders)
    today_orders.each do |order|
      authorize(order)
      order.update(completed: false) unless order.completed == false
    end
  end

end

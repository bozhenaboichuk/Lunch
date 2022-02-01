class LineItemsController < ApplicationController
  include CurrentOrder

  before_action :authenticate_user!
  before_action :set_current_order, only: [:create]
  before_action :set_line_item!, only: :destroy
  before_action :authorize_line_item
  
  def create
    dish = Dish.find(params[:dish_id])
    @line_item = @order.line_items.build(dish: dish)

    if @line_item.save
      notice = 'Dish was successfully added!'
      redirect_to restaurant_path(dish.restaurant, anchor: dom_id(dish)), status: :see_other, notice: notice
    else
      render :new
    end
  end

  def destroy
    @line_item.destroy
    redirect_to order_path(line_item.order), status: :see_other
  end

  private

  def authorize_line_item
    authorize(@order || @line_item.order || Order)
  end

  def set_line_item!
    @line_item = LineItem.find params[:id]
  end
end

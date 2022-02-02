class LineItemsController < ApplicationController
  include CurrentOrder

  before_action :authenticate_user!
  before_action :set_order, only: [:create]
  
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
    line_item = LineItem.find params[:id]
    line_item.destroy
    redirect_to order_path(line_item.order), status: :see_other
  end
end

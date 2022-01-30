class DishesController < ApplicationController
  before_action :set_restaurant!

  def create
    @dish = @restaurant.dishes.build dish_params
      if @dish.save
        redirect_to restaurant_path
      else
        render 'restaurants/show'
      end
  end

  def set_restaurant!
    @restaurant = Restaurant.find params[:restaurant_id]
  end

  def dish_params
    params.require(:dish).permit(:price, :weight, :name, :avatar)
  end

end

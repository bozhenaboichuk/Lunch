class DishesController < ApplicationController
  before_action :set_restaurant!

  def create
      @dish = @restaurant.dishes.build dish_params
      logger.debug "New dish: #{@dish.attributes.inspect}"
      logger.debug "Dish should be valid: #{@dish.valid?}"
      logger.debug @dish.errors.inspect
      if @dish.save
        logger.debug "The dish was saved and now thr user is going to be redirected..."
        redirect_to restaurant_path(@restaurant), status: :see_other
      else
        @types = DishType.all
        render 'restaurants/show'
      end
    end

  private

  def set_restaurant!
    @restaurant = Restaurant.find params[:restaurant_id]
  end

  def dish_params
    params.require(:dish).permit(:price, :weight, :name, :avatar, :dish_type_id)
  end

end

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

    def edit
      @dish = Dish.find_by id: params[:id]
    end

    def update
      @dish = Dish.find_by id: params[:id]
        if @dish.update dish_params
          redirect_to restaurant_path(@restaurant)
        else
          render 'restaurants/show'
        end
    end

    def new
      @dish = @restaurant.dishes.build
    end


    def destroy
      dish = @restaurant.dishes.find params[:id]
      dish.destroy
      redirect_to restaurant_path(@restaurant), status: :see_other
    end

  private

  def set_restaurant!
    @restaurant = Restaurant.find params[:restaurant_id]
  end

  def dish_params
    params.require(:dish).permit(:price, :weight, :describe, :name, :avatar, :dish_type_id)
  end

end

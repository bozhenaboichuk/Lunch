class RestaurantsController < ApplicationController
  before_action :set_restaurant!, except: %i[index new create edit]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new restaurant_params
      if @restaurant.save
        redirect_to restaurants_path
      else
        render :new
      end
  end

  def edit
    @restaurant = Restaurant.find_by id: params[:id]
  end

  def update
    @restaurant = Restaurant.find_by id: params[:id]
      if @restaurant.update restaurant_params
        redirect_to restaurants_path
      else
        render :edit
      end
  end

  def destroy
    @restaurant = Restaurant.find_by id: params[:id]
    @restaurant.destroy
    redirect_to restaurants_path
  end

  def show
    @types = DishType.all
    @dish = @restaurant.dishes.build
  end

  private

  def set_restaurant!
    @restaurant = Restaurant.find params[:id]
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :phone_number, :address, :avatar)
  end
end

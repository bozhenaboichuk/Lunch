class RestaurantsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_restaurant!, except: %i[index new create]
  before_action :authorize_restaurant

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new restaurant_params
      if @restaurant.save
        redirect_to restaurants_path, status: :see_other
      else
        render :new, status: :unprocessable_entity
      end
  end

  def edit
  end

  def update
    if @restaurant.update restaurant_params
      redirect_to restaurants_path, status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  def show
    @types = DishType.all
  end

  private

  def authorize_restaurant
    authorize(@restaurant || Restaurant)
  end

  def set_restaurant!
    @restaurant = Restaurant.find params[:id]
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :phone_number, :address, :picture, :upl_picture)
  end
end

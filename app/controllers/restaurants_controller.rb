class RestaurantsController < ApplicationController
  before_action :set_restaurant!, except: %i[index]

  def index
    @restaurants = Restaurant.all
  end
  
  def show
    @types = DishType.all
  end

  private

  def set_restaurant!
    @restaurant = Restaurant.find params[:id]
  end
end

class RestaurantsController < ApplicationController
  before_action :set_restaurant!, except: %i[index]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @dishes = @restaurant.dishes.all.includes(:dish_type)
    @first_dishes = @dishes.where(dish_type: DishType.find_by(name: 'first'))
    @second_dishes = @dishes.where(dish_type: DishType.find_by(name: 'second'))
    @salads = @dishes.where(dish_type: DishType.find_by(name: 'salad'))
    @deserts = @dishes.where(dish_type: DishType.find_by(name: 'desert'))
    @pizza = @dishes.where(dish_type: DishType.find_by(name: 'pizza'))
    @sushi = @dishes.where(dish_type: DishType.find_by(name: 'sushi'))
    @drinks = @dishes.where(dish_type: DishType.find_by(name: 'drinks'))
    @other_dishes = @dishes.where(dish_type: DishType.find_by(name: 'other_dishes'))
    @sets = @dishes.where(dish_type: DishType.find_by(name: 'sets'))
  end


  private

  def set_restaurant!
    @restaurant = Restaurant.find params[:id]
  end
end

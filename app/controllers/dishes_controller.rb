# frozen_string_literal: true

class DishesController < ApplicationController
  before_action :set_restaurant!
  before_action :set_dish!, only: %i[edit update destroy]
  before_action :authorize_dish

  def create
    @dish = @restaurant.dishes.build dish_params
    if @dish.save
      redirect_to restaurant_path(@restaurant), status: :see_other
    else
      @types = DishType.all
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @dish.update dish_params
      redirect_to restaurant_path(@restaurant), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @dish = @restaurant.dishes.build
  end

  def destroy
    @dish.destroy
    redirect_to restaurant_path(@restaurant), status: :see_other
  end

  private

  def authorize_dish
    authorize @dish || Dish
  end

  def set_restaurant!
    @restaurant = Restaurant.find params[:restaurant_id]
  end

  def set_dish!
    @dish = Dish.find params[:id]
  end

  def dish_params
    params.require(:dish).permit(:price, :weight, :describe, :name, :picture, :dish_type_id)
  end
end

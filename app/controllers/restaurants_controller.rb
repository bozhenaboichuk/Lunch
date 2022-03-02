# frozen_string_literal: true

class RestaurantsController < ApplicationController
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

  def edit; end

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

  def import
    require 'open-uri'
    url = 'https://legenda.if.ua/uk/legenda-pub/legenda-pub-menu/'
    fh = URI.open(url)
    html = fh.read
    doc = Nokogiri.HTML5(html)
    doc.css('.list_menu_dishes .section .list').each do |dlist|
      dish_name = dlist.css('.dish .table .table_td[1] .content > text()').each do |name|
      dish_price = dlist.css('.dish .table .table_td[2] .content').text().gsub('\n','')
      dish_describe = dlist.css('.intro:not(.table)').text().gsub('\n','')
      dish_type = dlist.css('li h3').text().gsub('\n','')

      dish_name = name.text().gsub('\n','')

        restaurant = Restaurant.find_or_create_by(name: 'Legenda pub', phone_number: '+38 (050) 378 8300')
        restaurant.dishes.create(name: dish_name, price: dish_price, weight: 0, describe: dish_describe, dish_type: DishType.find_or_create_by(name: dish_type))
        end
      end
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

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
      doc.css('.list_menu_dishes .section .list .dishes_list .dish .table .table_td[1] .content > text()').each do |name|
      doc.css('.list_menu_dishes .section .list .dishes_list .dish .table .table_td[2] .content').each do |price|
      doc.css('.list_menu_dishes .section .list .dishes_list .intro:not(.table)').each do |describe|

      dish_name = name.text().gsub('\n','')
      dish_price = price.text().gsub('\n','')
      dish_describe = describe.text().gsub('\n','')


        restaurant = Restaurant.find_or_create_by(name: 'Legenda pub', phone_number: '+38 (050) 378 8300')
        restaurant.dishes.create(name: name, price: price, weight: 0, describe: describe, dish_type: DishType.find_or_create_by(name: 'first'))
        end
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

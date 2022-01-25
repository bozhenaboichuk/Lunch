# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def populate_dish_types
  DishType.destroy_all
  DishType.create [{ name: "first" },
                   { name: "second" },
                   { name: "salad" },
                   { name: "desert" }]
end

def populate_restaurants
  Restaurant.create [{ name: "Test restaurant1", address: "Test address1", phone_number: "12345", picture: "f.jpg"},
                     { name: "Test restaurant2", address: "Test address2", phone_number: "12345", picture: "f.jpg" },
                     { name: "Test restaurant3", address: "Test address3", phone_number: "12345", picture: "f.jpg" },
                     { name: "Test restaurant4", address: "Test address4", phone_number: "12345", picture: "f.jpg" },
                     { name: "Test restaurant5", address: "Test address5", phone_number: "12345", picture: "f.jpg" }]
end

def populate_dishes
  Dish.destroy_all
  Dish.create [{ name: "Test first dish1 for restaurant1", dish_type: DishType.find_by(name: "first"), restaurant: Restaurant.first },
               { name: "Test second dish1 for restaurant1", dish_type: DishType.find_by(name: "second"), restaurant: Restaurant.first },
               { name: "Test salad1 for restaurant1", dish_type: DishType.find_by(name: "salad"), restaurant: Restaurant.first },
               { name: "Test desert1 for restaurant1", dish_type: DishType.find_by(name: "desert"), restaurant: Restaurant.first }]
end

populate_restaurants
populate_dish_types
populate_dishes

# coding: utf-8
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
                   { name: "desert" },
                   {name:"pizza"},
                   {name:"sushi"},
                   {name:"drinks"},
                   {name:"other_dishes"},
                   {name:"sets"}]
end

def populate_restaurants

  Restaurant.destroy_all
  Restaurant.create [{ name: "Пронто Піца", address: "вулиця Івасюка, 11", phone_number: "+380952775757", picture:"logo-pronto5f4dff025bafc.png" },
                     { name: "Десятка", address: "вулиця Шашкевича, 4", phone_number: "+380503738202", picture:"logodesiatka.png" }]

end


def populate_dishes
  Dish.destroy_all

  Dish.create [
               { name: "4 сезони", dish_type: DishType.find_by(name: "pizza"), restaurant: Restaurant.first,picture:"4-sezony-350x350.png", weight:0.5,price:154, describe:"Основа, томатний соус, сир моцарелла, папероні, гриби, кукурудза, шинка"},
               { name: "4 сири", dish_type: DishType.find_by(name: "pizza"), restaurant: Restaurant.first,picture:"4-syry-4.png", weight:0.42,price:169, describe:"Вершкова основа, сир моцарелла,королівський сир, пармезан, сир дор блю"},
               { name: "Аморе", dish_type: DishType.find_by(name: "pizza"), restaurant: Restaurant.first,picture:"amore.png", weight:0.56,price:159, describe:"Вершкова основа, сир моцарелла, курка, кукурудза, черрі, пармезан, рукола"},
               { name: "Базиліца", dish_type: DishType.find_by(name: "pizza"), restaurant: Restaurant.first,picture:"bazylicza-2.png", weight:0.42,price:149, describe:"Вершкова основа, сир моцарелла, помідори, фета, маслини, соус песто"},
               { name: "Гавайська", dish_type: DishType.find_by(name: "pizza"), restaurant: Restaurant.first,picture:"gavajska.png", weight:0.48,price:166, describe:"Вершкова основа, сир моцарелла, куряче філе, кукурудза, ананаси, маслини"},
               { name: "Капрічоза", dish_type: DishType.find_by(name: "pizza"), restaurant: Restaurant.first,picture:"kaprichoza-1.png", weight:0.55,price:159, describe:"Основа, томатний соус, сир моцарелла, гриби, салямі, шинка, помідори"},
               { name: "Карлеоне", dish_type: DishType.find_by(name: "pizza"), restaurant: Restaurant.first,picture:"karleone.png", weight:0.45,price:164, describe:"Основа, томатний соус, сир моцарелла, папероні, сир дор блю"},
               { name: "Козацька", dish_type: DishType.find_by(name: "pizza"), restaurant: Restaurant.first,picture:"kozaczka.png", weight:0.545,price:159, describe:"Основа, томатний соус, сир моцарелла, салямі, шинка, мисливські, маринований огірок, цибуля, чілі"},
               { name: "Корнелія", dish_type: DishType.find_by(name: "pizza"), restaurant: Restaurant.first,picture:"salyamikukurudza-kopiya.png", weight:0.45,price:134, describe:"Вершкова основа, сир моцарелла, салямі, кукурудза"},
               { name: "Маргарита", dish_type: DishType.find_by(name: "pizza"), restaurant: Restaurant.first,picture:"margaryta-1.png", weight:0.45,price:108, describe:"Основа, томатний соус, сир моцарелла, помідори"},
               { name: "Мексиканська", dish_type: DishType.find_by(name: "pizza"), restaurant: Restaurant.first,picture:"meksykanska-2.png", weight:0.51,price:174, describe:"Основа, томатний соус, сир моцарелла, гриби, папероні, бекон, перець халапеньо"},
               { name: "Папероні", dish_type: DishType.find_by(name: "pizza"), restaurant: Restaurant.first,picture:"paperoni.png", weight:0.41,price:157, describe:"Основа, томатний соус, сир моцарелла, папероні"},
               { name: "Песто", dish_type: DishType.find_by(name: "pizza"), restaurant: Restaurant.first,picture:"pesto.png", weight:0.46,price:164, describe:"Основа,томатний соус, сир моцарелла, шинка, бекон, перець болгарський, соус песто"},
               { name: "Піца з грушею", dish_type: DishType.find_by(name: "pizza"), restaurant: Restaurant.first,picture:"z-grusheyu-2.png", weight:0.46,price:167, describe:"Вершкова основа, сир моцарелла, груша, сир дор-блю, горіхи"},
               { name: "Пронто", dish_type: DishType.find_by(name: "pizza"), restaurant: Restaurant.first,picture:"pronto.png", weight:0.6,price:175, describe:"Основа, томатний соус, сир моцарелла, салямі, курка, шинка, бекон, помідори"},
               { name: "Прошуто Фунгі", dish_type: DishType.find_by(name: "pizza"), restaurant: Restaurant.first,picture:"proshuto-fungi.png", weight:0.43,price:139, describe:"Основа, томатний соус, сир моцарелла, гриби, шинка"},
               { name: "Сальмоне", dish_type: DishType.find_by(name: "pizza"), restaurant: Restaurant.first,picture:"salmone-2-350x350.png", weight:0.42,price:175, describe:"Вершкова основа, сир моцарелла, лосось, лимон, тимян"},
               { name: "Салямі", dish_type: DishType.find_by(name: "pizza"), restaurant: Restaurant.first,picture:"salyami-1-350x350.png", weight:0.4,price:139, describe:"Основа, томатний соус, сир моцарелла, салямі"},
               { name: "Спайсі Курка", dish_type: DishType.find_by(name: "pizza"), restaurant: Restaurant.first,picture:"spajsi-kurka-350x350.png", weight:0.48,price:143, describe:"Основа, томатний соус, сир моцарелла, курка, кукурудза, соус солодкий чіл"},
               { name: "Супрім", dish_type: DishType.find_by(name: "pizza"), restaurant: Restaurant.first,picture:"suprim-2-350x350.png", weight:0.46,price:139, describe:"Основа,томатний соус, сир моцарелла, помідори черрі, сир пармезан, рукола"},
               { name: "Техас", dish_type: DishType.find_by(name: "pizza"), restaurant: Restaurant.first,picture:"tehaska-350x350.png", weight:0.49,price:158, describe:"Основа, томатний соус, сир моцарелла, шинка, курка, помідори, солодкий чілі"},
               { name: "Фелічіта", dish_type: DishType.find_by(name: "pizza"), restaurant: Restaurant.first,picture:"felichita-350x350.png", weight:0.53,price:153, describe:"Основа, томатний соус, сир моцарелла,гриби, курка, бекон"},
               { name: "Цезар", dish_type: DishType.find_by(name: "pizza"), restaurant: Restaurant.first,picture:"czezar-350x350.png", weight:0.575,price:169, describe:"Основа, томатний соус, сир моцарелла, куряче філе, яйце перепелине варене, помідори черрі, айсберг, пармезан"},
               { name: "Чізбургер", dish_type: DishType.find_by(name: "pizza"), restaurant: Restaurant.first,picture:"chizburger-350x350.png", weight:0.54,price:144, describe:"Основа, томатний соус, сир моцарелла, бекон, огірок маринований, помідори, цибуля, гірчиця американська"},

               { name: "Місо суп з креветками", dish_type: DishType.find_by(name: "first"), restaurant: Restaurant.first,picture:"misozkrevet.png", weight:0.35,price:99, describe:"Соєва паста, приправа Хондаші, лапша рисова, водорості суш. Вакаме, насіння кунжуту, креветка тигрова"},
               { name: "Місо суп з лососем", dish_type: DishType.find_by(name: "first"), restaurant: Restaurant.first,picture:"misozlososem.png", weight:0.35,price:99, describe:"Соєва паста, приправа Хондаші, лапша рисова, водорості суш. Вакаме, насіння кунжуту, лосось"},
               { name: "Том ям з креветками", dish_type: DishType.find_by(name: "first"), restaurant: Restaurant.first,picture:"tomjam-z-krev.png", weight:0.35,price:99, describe:"Соєва паста, приправа Хондаші, рис маринований, гриби, том ям паста, креветка тигрова, вершки"},
               { name: "Том ям з лососем", dish_type: DishType.find_by(name: "first"), restaurant: Restaurant.first,picture:"tomjam-z-lososem.png", weight:0.35,price:99, describe:"Соєва паста, приправа Хондаші, рис маринований, гриби, томям паста, лосось, вершки"},
               { name: "Бульйон з куркою", dish_type: DishType.find_by(name: "first"), restaurant: Restaurant.first,picture:"bul-275x275.png", weight:0.361,price:47, describe:"Курячий бульйон на основі домашньої курятини та овочів, з локшиною та зеленню"},

               { name: "Картопля Фрі", dish_type: DishType.find_by(name: "other_dishes"), restaurant: Restaurant.first,picture:"1kartoplya-fri.jpg", weight:0.1,price:38, describe:"Хрустка картопля, обсмажена до золотистої скоринки"},
               { name: "Курячі крильця", dish_type: DishType.find_by(name: "other_dishes"), restaurant: Restaurant.first,picture:"1kuryachi-krylczya.jpg", weight:0.35,price:84, describe:"Соковиті, обсмажені до рум'яної скоринки курячі крильця (5шт)"},
               { name: "Курячі нагетси", dish_type: DishType.find_by(name: "other_dishes"), restaurant: Restaurant.first,picture:"1kuryachi-nagetsy.jpg", weight:0.19,price:57, describe:"Соковиті, обсмажені до золотистої скоринки курячі нагетси (6шт)"},
               { name: "Соус Барбекю", dish_type: DishType.find_by(name: "other_dishes"), restaurant: Restaurant.first,picture:"1barbekyu-275x275.jpg", weight:0.05,price:14, describe:"Фірмовий соус за власним рецептом"},
               { name: "Соус Цезар", dish_type: DishType.find_by(name: "other_dishes"), restaurant: Restaurant.first,picture:"1czezar-275x275.jpg", weight:0.05,price:14, describe:"Фірмовий соус за власним рецептом"},
               { name: "Соус Часниковий", dish_type: DishType.find_by(name: "other_dishes"), restaurant: Restaurant.first,picture:"1chasnykovyj-275x275.jpg", weight:0.05,price:14, describe:"Фірмовий соус за власним рецептом"},


               { name: "Салат Грецький", dish_type: DishType.find_by(name: "salad"), restaurant: Restaurant.first,picture:"1sgreczkyj-275x275.png", weight:0.21,price:69, describe:"Мікс салату, помідор, огірок, перець болгарський, сир фета оливки, цибуля синя"},
               { name: "Салат з Лососем", dish_type: DishType.find_by(name: "salad"), restaurant: Restaurant.first,picture:"1sz-lososem-275x275.png", weight:0.19,price:97, describe:"Мікс салату, огірок, помідор черрі, лосось, руколла, олія+лимон, кунжут"},
               { name: "Салат Фітнес", dish_type: DishType.find_by(name: "salad"), restaurant: Restaurant.first,picture:"1sfitnes-275x275.png", weight:0.19,price:69, describe:"Мікс салату, авокадо, огірок, помідор, соєвий соус, кунжут"},
               { name: "Салат Цезар", dish_type: DishType.find_by(name: "salad"), restaurant: Restaurant.first,picture:"1sczezar-1-275x275.png", weight:0.23,price:79, describe:"Мікс салату, помідори черрі, яйце перепелине, курка печена, сухарики, сир пармезан, соус Цезар"},
               { name: "Салат Чука", dish_type: DishType.find_by(name: "salad"), restaurant: Restaurant.first,picture:"1ssalat-chuka-275x275.png", weight:0.19,price:67, describe:"Салат чука, горіховий соус, кунжут"},


               { name: "Садочок в асортименті 1л", dish_type: DishType.find_by(name: "drinks"), restaurant: Restaurant.first, picture:"1nsadochok.jpg", weight:1,price:37},
               { name: "Сандора томатна 1л", dish_type: DishType.find_by(name: "drinks"), restaurant: Restaurant.first, picture:"1nsandora-tomat.jpg", weight:1,price:48},
               { name: "Сандора Фруктова 1л", dish_type: DishType.find_by(name: "drinks"), restaurant: Restaurant.first, picture:"1nsandora-fr.jpg", weight:1,price:48},
               { name: "7UP", dish_type: DishType.find_by(name: "drinks"), restaurant: Restaurant.first, picture:"1n7up.png", weight:1,price:28},
               { name: "Mirinda", dish_type: DishType.find_by(name: "drinks"), restaurant: Restaurant.first, picture:"1nmirinda.png", weight:1,price:28},
               { name: "Пепсi ж/б", dish_type: DishType.find_by(name: "drinks"), restaurant: Restaurant.first, picture:"1npepsi-zh.jpg", weight:0.33,price:18},
               { name: "Пепсi", dish_type: DishType.find_by(name: "drinks"), restaurant: Restaurant.first, picture:"1npepsi.jpg", weight:2,price:44}
               ]
end




populate_restaurants
populate_dish_types
populate_dishes

require "../lib/dish.rb"
require "../lib/restaurant.rb"

RSpec.describe "Integration" do
    it "adds a dish instance to the order" do
        io = double :io
    chinese = Restaurant.new(io)
    item_1 = Dish.new("Fried chicken", 4.99, io)
    item_2 = Dish.new("Fried fish", 5.99, io)
    item_3 = Dish.new("Fried chips", 3.99, io)
    item_4 = Dish.new("Fried fries", 1.99, io)
    item_5 = Dish.new("Fried coke", 2.99, io)
    chinese.add_to_menu(item_1)
    chinese.add_to_menu(item_2)
    chinese.add_to_menu(item_3)
    chinese.add_to_menu(item_4)
    chinese.add_to_menu(item_5)
    expect(chinese.view_menu).to eq "1. Fried chicken - $4.99\n2. Fried fish - $5.99\n3. Fried chips - $3.99\n4. Fried fries - $1.99\n5. Fried coke - $2.99\n"
    end

    it "adds a dish instance to the order" do
        io = double :io
    chinese = Restaurant.new(io)
    item_1 = Dish.new("Fried chicken", 4.99, io)
    item_2 = Dish.new("Fried fish", 5.99, io)
    item_3 = Dish.new("Fried chips", 3.99, io)
    item_4 = Dish.new("Fried fries", 1.99, io)
    item_5 = Dish.new("Fried coke", 2.99, io)
    chinese.add_to_menu(item_1)
    chinese.add_to_menu(item_2)
    chinese.add_to_menu(item_3)
    chinese.add_to_menu(item_4)
    chinese.add_to_menu(item_5)
    chinese.add(1)
    chinese.add(2)
    expect(chinese.view_order).to eq "1. Fried chicken - $4.99\n2. Fried fish - $5.99\nTotal: $10.98"
    end

    it "adds a dish instance to the order" do
        io = double :io
    chinese = Restaurant.new(io)
    item_1 = Dish.new("Fried chicken", 4.99, io)
    item_2 = Dish.new("Fried fish", 5.99, io)
    item_3 = Dish.new("Fried chips", 3.99, io)
    item_4 = Dish.new("Fried fries", 1.99, io)
    item_5 = Dish.new("Fried coke", 2.99, io)
    chinese.add_to_menu(item_1)
    chinese.add_to_menu(item_2)
    chinese.add_to_menu(item_3)
    chinese.add_to_menu(item_4)
    chinese.add_to_menu(item_5)
    chinese.add(1)
    chinese.add(2)
    expect(chinese.view_dietary_requirements).to eq "Fried chicken - Contains nuts? - true,\nVegan? - false,\nVegetarian? - false,\nIncludes Gluten? - true,\nIncludes shellfish? - true,\nIncludes dairy? - true,\nMeat is Kosher? - false,\nMeat is Halal? - false\nFried fish - Contains nuts? - true,\nVegan? - false,\nVegetarian? - false,\nIncludes Gluten? - true,\nIncludes shellfish? - true,\nIncludes dairy? - true,\nMeat is Kosher? - false,\nMeat is Halal? - false\n"
    end

    it "adds a dish instance to the order" do
        io = double :io
    chinese = Restaurant.new(io)
    item_1 = Dish.new("Fried chicken", 4.99, io)
    item_2 = Dish.new("Fried fish", 5.99, io)
    item_3 = Dish.new("Fried chips", 3.99, io)
    item_4 = Dish.new("Fried fries", 1.99, io)
    item_5 = Dish.new("Fried coke", 2.99, io)
    chinese.add_to_menu(item_1)
    chinese.add_to_menu(item_2)
    chinese.add_to_menu(item_3)
    chinese.add_to_menu(item_4)
    chinese.add_to_menu(item_5)
    chinese.add(1)
    chinese.add(2)
    chinese.kosher
    expect(chinese.view_dietary_requirements).to eq "Fried chicken - Contains nuts? - true,\nVegan? - false,\nVegetarian? - false,\nIncludes Gluten? - true,\nIncludes shellfish? - false,\nIncludes dairy? - true,\nMeat is Kosher? - true,\nMeat is Halal? - false\nFried fish - Contains nuts? - true,\nVegan? - false,\nVegetarian? - false,\nIncludes Gluten? - true,\nIncludes shellfish? - false,\nIncludes dairy? - true,\nMeat is Kosher? - true,\nMeat is Halal? - false\n"
    end
end
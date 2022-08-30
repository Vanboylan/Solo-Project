require "../lib/dish"

RSpec.describe Dish do
    it "constucts" do
        io = double :io
        fried_chicken = Dish.new("Fried chicken", 4.99, io)
        expect(fried_chicken).to be
    end

    it "views the dish and attributes" do
        io = double :io
        fried_chicken = Dish.new("Fried chicken", 4.99, io)
        expect(fried_chicken.attributes).to eq "Contains nuts? - true,\nVegan? - false,\nVegetarian? - false,\nIncludes Gluten? - true,\nIncludes shellfish? - true,\nIncludes dairy? - true,\nMeat is Kosher? - false,\nMeat is Halal? - false"
    end

    it "allows attribute changes" do
        io = double :io
        
        expect(io).to receive(:puts).with("select attribute to change")
        expect(io).to receive(:puts).with("1. Make Vegan,\n2. Make Vegetarian,\n3. Remove gluten?\n4. Remove shellfish?,\n5. Make Kosher?,\n6. Make Halal?,\n7. Remove dairy?\n8. Remove nuts?,\n9. Revert changes?\n10. Exit")
        expect(io).to receive(:gets).and_return("1")
        expect(io).to receive(:puts).with("1. Make Vegan,\n2. Make Vegetarian,\n3. Remove gluten?\n4. Remove shellfish?,\n5. Make Kosher?,\n6. Make Halal?,\n7. Remove dairy?\n8. Remove nuts?,\n9. Revert changes?\n10. Exit")
        expect(io).to receive(:gets).and_return("10")

        fried_chicken = Dish.new("Fried chicken", 4.99, io)
        fried_chicken.changes
    end

    it "shows attribute changes" do
        io = double :io
        
        expect(io).to receive(:puts).with("select attribute to change")
        expect(io).to receive(:puts).with("1. Make Vegan,\n2. Make Vegetarian,\n3. Remove gluten?\n4. Remove shellfish?,\n5. Make Kosher?,\n6. Make Halal?,\n7. Remove dairy?\n8. Remove nuts?,\n9. Revert changes?\n10. Exit")
        expect(io).to receive(:gets).and_return("1")
        expect(io).to receive(:puts).with("1. Make Vegan,\n2. Make Vegetarian,\n3. Remove gluten?\n4. Remove shellfish?,\n5. Make Kosher?,\n6. Make Halal?,\n7. Remove dairy?\n8. Remove nuts?,\n9. Revert changes?\n10. Exit")
        expect(io).to receive(:gets).and_return("10")

        fried_chicken = Dish.new("Fried chicken", 4.99, io)
        fried_chicken.changes
        expect(fried_chicken.attributes).to eq "Contains nuts? - true,\nVegan? - true,\nVegetarian? - true,\nIncludes Gluten? - true,\nIncludes shellfish? - false,\nIncludes dairy? - false,\nMeat is Kosher? - false,\nMeat is Halal? - false"
    end

    it "reverts attribute changes" do
        io = double :io
        
        expect(io).to receive(:puts).with("select attribute to change")
        expect(io).to receive(:puts).with("1. Make Vegan,\n2. Make Vegetarian,\n3. Remove gluten?\n4. Remove shellfish?,\n5. Make Kosher?,\n6. Make Halal?,\n7. Remove dairy?\n8. Remove nuts?,\n9. Revert changes?\n10. Exit")
        expect(io).to receive(:gets).and_return("1")
        expect(io).to receive(:puts).with("1. Make Vegan,\n2. Make Vegetarian,\n3. Remove gluten?\n4. Remove shellfish?,\n5. Make Kosher?,\n6. Make Halal?,\n7. Remove dairy?\n8. Remove nuts?,\n9. Revert changes?\n10. Exit")
        expect(io).to receive(:gets).and_return("10")

        fried_chicken = Dish.new("Fried chicken", 4.99, io)
        fried_chicken.changes
        expect(fried_chicken.attributes).to eq "Contains nuts? - true,\nVegan? - true,\nVegetarian? - true,\nIncludes Gluten? - true,\nIncludes shellfish? - false,\nIncludes dairy? - false,\nMeat is Kosher? - false,\nMeat is Halal? - false"
        fried_chicken.revert_changes
        expect(fried_chicken.attributes).to eq "Contains nuts? - true,\nVegan? - false,\nVegetarian? - false,\nIncludes Gluten? - true,\nIncludes shellfish? - true,\nIncludes dairy? - true,\nMeat is Kosher? - false,\nMeat is Halal? - false"
    end

end
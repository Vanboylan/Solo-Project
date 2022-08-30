class Dish
  def initialize(name, price, io)
    @io = io
    @name = name
    @price = price
    @vegan = false
    @vegetarian = false
    @gluten = true
    @shellfish = true
    @dairy = true
    @kosher = false
    @halal = false
    @nuts = true
  end

  def view_dish
    "#{@name} - $#{@price}\n#{attributes}"
  end

  def attributes
    "Contains nuts? - #{@nuts},\nVegan? - #{@vegan},\nVegetarian? - #{@vegetarian},\nIncludes Gluten? - #{@gluten},\nIncludes shellfish? - #{@shellfish},\nIncludes dairy? - #{@dairy},\nMeat is Kosher? - #{@kosher},\nMeat is Halal? - #{@halal}\n"
  end

  def name
    @name
  end

  def price
    @price
  end

  def changes
    @io.puts "select attribute to change"
    loop do
      @io.puts "1. Make Vegan,\n2. Make Vegetarian,\n3. Remove gluten?\n4. Remove shellfish?,\n5. Make Kosher?,\n6. Make Halal?,\n7. Remove dairy?\n8. Remove nuts?,\n9. Revert changes?\n10. Exit"
      answer = @io.gets.chomp
      case answer
      when "1"
        vegan
        "Dish is now vegan"
      when "2"
        vegetarian
        "Dish is now vegetarian"
      when "3"
        gluten_free
        "Dish is now gluten-free"
      when "4"
        shellfish_free
        "Dish is now free of shellfish"
      when "5"
        kosher
        "Dish is now Kosher"
      when "6"
        halal
        "Dish is now Halal"
      when "7"
        dairy_free
        "Dish is now dairy free"
      when "8"
        nut_free
        "Dish is now nut free"
      when "9"
        revert_changes
        "Dish is back to original state"
      when "10"
        break
      end
    end
  end

  def gluten_free
    @gluten = false
  end

  def nut_free
    @nuts = false
  end
  
  def vegetarian
    @vegetarian = true
    @shellfish = false
  end
  
  def vegan
    @vegan = true
    @vegetarian = true
    @shellfish = false
    @dairy = false
  end
  
  def shellfish_free
    @shellfish = false
  end
  
  def kosher
    @shellfish = false
    @kosher = true
    @halal = false
  end
  
  def halal
    @halal = true
    @kosher = false
  end
  
  def revert_changes
    @vegan = false
    @vegetarian = false
    @gluten = true
    @dairy = true
    @shellfish = true
    @kosher = false
    @halal = false
    @nuts = true
  end
  
  def dairy_free
    @dairy = false
  end
end

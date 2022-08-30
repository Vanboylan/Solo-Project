class Restaurant
    def initialize(io)
        @io = io
        @menu = []
        @order = []
        @total = 0
    end

    def add_to_menu(item)
        @menu << item
    end

    def view_menu
        menu_string = ""
        @menu.each.with_index(1) {|item, index|
        menu_string << "#{index}. #{item.name} - $#{item.price}\n"}
        return menu_string
    end

    def view_order
        order_string = ""
        @total = 0
        @order.each.with_index(1) {|item, index|
        order_string << "#{index}. #{item.name} - $#{item.price}\n"
        @total += item.price}
        return "#{order_string}Total: $#{@total}"
    end

    def add(number)
      @order << @menu[number - 1]
    end

    def nut_free
      @order.each {|item|
        item.nut_free}
    end

    def halal
      @order.each {|item|
        item.halal}
    end

    def kosher
        @order.each {|item|
        item.kosher}
    end
    def dairy_free
        @order.each {|item|
          item.dairy_free}
      end

    def shellfish_free
      @order.each {|item|
        item.shellfish_free}
    end

    def vegan
      @order.each {|item|
        item.vegan}
    end

    def vegetarian
        @order.each {|item|
          item.vegetarian}
    end

    def gluten_free
        @order.each {|item|
        item.gluten_free}
    end

    def revert_changes
        @order.each {|item|
        item.revert_changes}
    end

    def view_dietary_requirements
        dietary_string = ""
        @order.each {|item|
        dietary_string << "#{item.name} - #{item.attributes}"}
        return dietary_string
    end
  
end
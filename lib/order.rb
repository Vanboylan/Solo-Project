
class Order
  def initialize
    @menu = {
        "fried chicken" => 1.99,
        "fried fish" => 2.99,
        "fried shrimp" => 5.99,
        "fried vegetables" => 1.99,
        "fried coca cola" => 3.99,
        "fried fries" => 0.87
    }
    @order = []
    @total = 0
  end

  def view_menu
    @menu.to_s
  end

  def add(dish)
    fail "Not a valid dish" if !@menu.include?(dish)
    @order << dish
    @total += @menu[dish]
  end

  def verify_order
    @order
  end

  def total
    "£#{@total}"
  end

  def receipt
    fail "Nothing in order" if @order.empty?
    "#{@order.join("\n")}\nTotal: £#{@total}"
  end
end

  
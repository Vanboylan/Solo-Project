require 'dotenv/load'
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

    def checkout
        "Your order is complete:\n#{view_order}"
       sms_confirmation
    end

    private

    def sms_confirmation
        require 'twilio-ruby'
        account_sid = ENV["TWILIO_ACCOUNT_SID"]
        auth_token = ENV["TWILIO_AUTH_TOKEN"]
        client = Twilio::REST::Client.new(account_sid, auth_token)

        from = '+18148319758' # Your Twilio number
        to = '+447759277252' # Your mobile phone number

        client.messages.create(
        from: from,
        to: to,
        body: "Your order is complete, it will be delivered at #{Time.now + 30*60}"
        )
    end
end 
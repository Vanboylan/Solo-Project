require "../lib/restaurant"

RSpec.describe Restaurant do
    it "constructs" do
        io = double :io
        expect(chinese = Restaurant.new(io)).to be
    end

    it "shows menu" do
        io = double :io
        chinese = Restaurant.new(io)
        expect(chinese.view_menu).to eq "1. Fried chicken - $4.99\n2. fish - $5.99\n3. Carrots in fat - $1.33\n"
    end

    it "adds to and displays order" do
      io = double :io
      chinese = Restaurant.new(io)
      

end
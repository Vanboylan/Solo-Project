require "../lib/order.rb"

RSpec.describe Order do
  it "adds to order" do
    jason = Order.new
    jason.add("fried chicken")
    expect(jason.verify_order).to eq ["fried chicken"]
  end

  context "when incorrect dish is added" do
    it "fails" do
      jason = Order.new
      expect { jason.add("fri chick") }.to raise_error "Not a valid dish"
    end
  end

  it "displays the menu" do
    jason = Order.new
    expect(jason.view_menu).to eq "{\"fried chicken\"=>1.99, \"fried fish\"=>2.99, \"fried shrimp\"=>5.99, \"fried vegetables\"=>1.99, \"fried coca cola\"=>3.99, \"fried fries\"=>0.87}"
  end

  it "gives correct value for total in receipt" do
    jason = Order.new
    jason.add("fried chicken")
    jason.add("fried fish")
    expect(jason.total).to eq "£4.98"
  end

  it "gives correct itemised receipt" do
    jason = Order.new
    jason.add("fried chicken")
    jason.add("fried fish")
    expect(jason.receipt).to eq "fried chicken\nfried fish\nTotal: £4.98"
  end

  context "when nothing is in order" do
    it "fails when asked for receipt" do
      jason = Order.new
      expect { jason.receipt }.to raise_error "Nothing in order"
    end
  end

  context "when order is empty" do
    it "fails when checking out" do
      jason = Order.new
      expect { jason.checkout }.to raise_error "Nothing to checkout"
    end
  end

end
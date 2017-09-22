
class CashRegister
  attr_accessor :discount, :total, :items
  # attr_reader :total <-- Q: Not sure why this isnt working.
  def initialize(discount = 0)
    @items = Array.new
    @discount = discount
    @total = 0
  end

  def add_item(item, price, qty = 1)
    @total += price * qty
    while qty > 0
      @items << item
      qty-=1
    end
    @total
  end

  def apply_discount
    if @discount > 0
      percentage_of_total = 1 - (@discount * 0.01)
      @total *= percentage_of_total
      @total
      "After the discount, the total comes to #{total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction

  end

end


class CashRegister
  attr_accessor :discount, :total, :items, :last_item
  # attr_reader :total <-- Q: Not sure why this isnt working.
  def initialize(discount = 0)
    @items = Array.new
    @discount = discount
    @total = 0
    @last_item = Array.new
  end

  def add_item(item, price, qty = 1)
    self.total += price * qty
    self.last_item = Array.new
    self.last_item << item
    self.last_item << price
    self.last_item << qty
    self.last_item
    while qty > 0
      self.items << item
      qty-=1
    end
    self.total
  end

  def apply_discount
    if self.discount > 0
      percentage_of_total = 1 - (self.discount * 0.01)
      self.total *= percentage_of_total
      self.total
      "After the discount, the total comes to $#{self.total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total = self.total - (self.last_item)
  end

end

class CashRegister
  attr_accessor :total
  attr_reader :discount
  attr_reader :items

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(item, price, quantity=1)
    quantity.times { @items << item }
    @total += price * quantity
    @last_transaction = price * quantity
  end

  def apply_discount
    return "There is no discount to apply." if @discount == 0
    @total -= @total * (@discount.to_f / 100)
    "After the discount, the total comes to $#{@total.to_i}."
  end

  def void_last_transaction
    @total -= @last_transaction
  end
end

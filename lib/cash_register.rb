require 'pry'

class CashRegister
  attr_accessor :total, :discount, :items, :transactions

  def initialize(employee=nil)
    @total = 0
    @discount = 20 if employee
    @items = []
    @transactions = []
  end

  def add_item(title, price, quantity=1)
    @total += price * quantity
    quantity.times { @items << title }
    @transactions << price * quantity
  end

  def apply_discount
    if @discount
      @total -= @total * (@discount/100.00)
      "After the discount, the total comes to $#{@total.round}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @transactions.pop
  end
end

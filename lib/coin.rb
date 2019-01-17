class Coin
  attr_reader :value, :quantity

  def initialize(value, quantity = 40)
    @value = value
    @quantity = quantity
  end

  def refund(amount)
    @quantity -= amount
  end

  def insert(amount)
    @quantity += amount
  end
end

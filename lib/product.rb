class Product
  attr_reader :name, :price, :quantity

  def initialize(name, price, quantity)
    @name = name
    @price = price
    @quantity = quantity
  end

  def vend
    @quantity -= 1
  end

  def reload(amount)
    @quantity += amount
  end
end

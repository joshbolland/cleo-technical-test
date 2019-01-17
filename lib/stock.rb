require_relative './product'

class Stock
  attr_reader :products

  def initialize
    @products = initial_products
  end

  private

  def initial_products
    [
      Product.new('Fanta', 150, 5),
      Product.new('Sprite', 150, 8),
      Product.new('Coke', 170, 10),
      Product.new('Water', 100, 10),
      Product.new('Yorkie', 80, 13),
      Product.new('Galaxy', 90, 1),
      Product.new('Milkybar', 70, 7),
      Product.new('Skittles', 80, 2)
    ]
  end
end

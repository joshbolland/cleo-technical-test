require_relative './coin'

class Change
  attr_reader :coins

  def initialize
    @coins = initial_change_supply
  end

  private

  def initial_change_supply
    [
      Coin.new(200),
      Coin.new(100),
      Coin.new(50),
      Coin.new(20),
      Coin.new(10),
      Coin.new(5),
      Coin.new(2),
      Coin.new(1)
    ]
  end
end

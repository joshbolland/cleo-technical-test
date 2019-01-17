require_relative './coin'

class Change
  attr_reader :coins

  def initialize
    @coins = initial_change_supply
  end

  def refund_coin(denomination, amount)
    coin_index = nil
    @coins.each_with_index do |coin, index|
      coin_index = index if coin.value == denomination
    end
    coin = @coins[coin_index]
    coin.refund(amount)
  end

  def insert_coin(denomination, amount)
    coin_index = nil
    @coins.each_with_index do |coin, index|
      coin_index = index if coin.value == denomination
    end
    coin = @coins[coin_index]
    coin.insert(amount)
  end

  def return_change(coins, price)
    due_change = sum(coins) - price
    remainder = due_change
    customer_change(due_change, remainder)
  end

  private

  def sum(coins)
    coins.reduce(:+)
  end

  def customer_change(due_change, remainder)
    change = []
    until sum(change) == due_change
      @coins.each do |coin|
        if coin.value <= remainder && coin.quantity.positive?
          change, remainder = refund_customer_change(coin, remainder, change)
          break
        end
      end
    end
    change
  end

  def refund_customer_change(coin, remainder, change)
    change << coin.value if coin.quantity.positive?
    remainder -= coin.value
    refund_coin(coin.value, 1)
    [change, remainder]
  end

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

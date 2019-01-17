require_relative './message'
require_relative './stock'
require_relative './change'

class Vend
  VALID_COINS = [1, 2, 5, 10, 20, 50, 100, 200].freeze
  attr_reader :message, :selection, :stock, :change, :due_change

  def initialize(selection, stock, change)
    @message = Message.new
    @selection = selection
    @stock = stock
    @change = change
    @due_change = nil
  end

  def vend_product
    quantity = @stock.products[@selection].quantity
    return @message.sold_out if quantity.zero?

    price = @stock.products[@selection].price
    take_coins(price)
    product_and_change
  end

  def take_coins(price)
    coins = sufficient_coins(price)
    coins.each { |coin| @change.insert_coin(coin, 1) }
    @due_change = @change.return_change(coins, price) if sum(coins) > price
  end

  def product_and_change
    dispense_product
    customer_change
  end

  def dispense_product
    @stock.vend_product(@selection)
    product = @stock.products[@selection]
    @selection = nil
    @message.product_vended(product)
  end

  def customer_change
    change = @due_change
    if change.nil?
      @message.no_change
    else
      @message.customer_change_message(change)
    end
  end

  private

  def sufficient_coins(price)
    coins = [0]
    while sum(coins) < price
      inserted_coin = new_coin
      coins << inserted_coin if valid_coin?(inserted_coin)
    end
    coins.drop(1)
  end

  def sum(array)
    array.reduce(:+)
  end

  def valid_coin?(inserted_coin)
    VALID_COINS.include?(inserted_coin) ? true : @message.invalid_coin
  end

  def new_coin
    @message.insufficient_coins
    gets.chomp.to_i
  end
end

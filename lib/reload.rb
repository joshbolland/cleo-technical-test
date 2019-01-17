require_relative './message'
require_relative './stock'
require_relative './change'

class Reload
  attr_reader :message, :stock, :change

  def initialize(stock, change)
    @message = Message.new
    @stock = stock
    @change = change
  end

  def assign_selection_and_reload
    @message.reload_options
    selection = gets.chomp.downcase
    return reload_change if selection == 'change'
    return reload_products if selection == 'product'

    @message.invalid_input
  end

  def reload_change
    denomination = coin_type
    quantity = item_quantity
    insert_coins(denomination, quantity)
  end

  def reload_products
    product_index = product_to_reload
    quantity = item_quantity
    reload_chosen_products(product_index, quantity)
  end

  private

  def coin_type
    @message.coin_type_question
    gets.chomp.to_i
  end

  def product_to_reload
    @message.reload_selection(@stock)
    gets.chomp.to_i - 1
  end

  def item_quantity
    @message.quantity_question
    gets.chomp.to_i
  end

  def insert_coins(denomination, quantity)
    @change.insert_coin(denomination, quantity)
    @message.coin_reload_successful
  end

  def reload_chosen_products(index, quantity)
    @stock.reload_product(index, quantity)
    @message.product_reload_successful(@stock)
  end
end

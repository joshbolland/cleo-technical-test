require_relative './stock'
require_relative './change'
require_relative './message'
require_relative './vend'
require_relative './reload'

class Machine
  attr_reader :stock, :change, :message, :selection

  def initialize
    @stock = Stock.new
    @change = Change.new
    @message = Message.new
    @selection = nil
  end

  def start
    loop do
      user_menu
      assign_selection
      handle_selection
    end
  end

  def user_menu
    @message.start_message
    @message.product_list(@stock)
    @message.user_options
  end

  def assign_selection
    input = gets.chomp.downcase
    return @selection = input if input == 'reload' || input == 'exit'

    input = input.to_i - 1
    return @selection = input if input >= 0 && input < @stock.products.length

    @message.invalid_input
  end

  def handle_selection
    vend(Vend.new(@selection, @stock, @change)) if @selection.class == Integer
    reload(Reload.new(@stock, @change)) if @selection == 'reload'
    exit if @selection == 'exit'
    @selection = nil
  end

  def vend(vend)
    vend.vend_product
  end

  def reload(reload)
    reload.assign_selection_and_reload
  end
end

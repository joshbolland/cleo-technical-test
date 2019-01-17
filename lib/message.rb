require 'colorize'

class Message
  def start_message
    puts '*'.blue * 50
    puts ''
    puts 'Hey! Cleo Vending Machine at your service 😋'
    puts ''
    puts '*'.blue * 50
  end

  def product_list(stock)
    stock.products.each_with_index do |product, index|
      if product.quantity.positive?
        puts "#{index + 1}. #{product.name}: #{product.price}p - #{product.quantity} remaining"
      else
        puts "#{index + 1}. #{product.name}: SOLD OUT.".red
      end
    end
  end

  def user_options
    puts 'Please enter a number to make a selection 🥤🍫. Alternatively, type reload to fill up this machine, or just type exit to get outta here!'
  end
end

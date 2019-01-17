require 'colorize'

class Message
  def start_message
    puts '*'.blue * 50
    puts ''
    puts 'Hey there! Cleo Vending Machine at your service 😋'
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

  def invalid_input
    puts 'Sorry, not quite sure what you meant there! Please try again.'.red
  end

  def insufficient_coins
    puts 'Please insert more coins. We accept 1p, 2p, 5p, 10p, 20p, 50p, 100p or 200p coins!'
  end

  def sold_out
    puts 'Sorry, we\'re out of that at the moment!'.red
  end

  def product_vended(product)
    puts "Find your #{product.name} in the slot below. Enjoy!"
  end

  def customer_change_message(change)
    puts 'Remember your change:'.green
    change.each do |coin|
      puts "#{coin}p".green
    end
  end

  def no_change
    puts 'No change due.'
  end

  def reload_options
    puts 'What are we reloading today? Please enter either \'Product\' or \'Change\'.'
  end

  def coin_type_question
    puts 'What type of coin would you like to reload? Please input either 1, 2, 5, 10, 20, 50, 100, or 200.'
  end

  def quantity_question
    puts 'How many would you like to reload?'
  end

  def product_reload_successful(stock)
    puts 'See my new stock count below:'.green
    stock.products.each_with_index do |product, index|
      puts "#{index + 1}. #{product.name} - Quantity remaining: #{product.quantity}"
    end
    puts 'I feel nice and full now 😋 Thank you!'.green
  end

  def coin_reload_successful
    puts 'They tasted very metallic... but thank you for the coins anyway!'
  end

  def reload_selection(stock)
    stock.products.each_with_index do |product, index|
      puts "#{index + 1}. #{product.name} - Quantity remaining: #{product.quantity}"
    end
  end

  def invalid_coin
    puts 'Sorry, I don\'t recognise that coin, try a different one listed below!'.red
  end
end

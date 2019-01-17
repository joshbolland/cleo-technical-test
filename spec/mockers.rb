def make_mock_products(product)
  mock_products = [:product, product]
  allow_any_instance_of(Stock).to receive(:initial_products) { mock_products }
  Stock.new
end

def make_mock_coins(coin)
  allow(coin).to receive(:value) { 1 }
  mock_coins = [coin]
  allow_any_instance_of(Change).to receive(:initial_change_supply) { mock_coins }
  Change.new
end

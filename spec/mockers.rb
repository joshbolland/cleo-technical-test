def make_mock_products(product)
  mock_products = [:product, product]
  allow_any_instance_of(Stock).to receive(:initial_products) { mock_products }
  Stock.new
end

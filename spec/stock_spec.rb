require 'stock'

describe Stock do
  let(:stock) { described_class.new }
  let(:product) { spy('product') }

  describe '#initialize' do
    it 'Products attribute is an array object' do
      expect(stock.products).to be_an(Array)
    end

    it 'Products are instances of the Product class' do
      expect(stock.products[2]).to be_an_instance_of(Product)
    end
  end

  describe '#vend_product' do
    it 'Product is vended properly' do
      mock_stock = make_mock_products(product)
      mock_stock.vend_product(1)
      expect(product).to have_received(:vend)
    end
  end

  describe '#reload_product' do
    it 'Product reloads properly' do
      mock_stock = make_mock_products(product)
      mock_stock.reload_product(1, 10)
      expect(product).to have_received(:reload).with(10)
    end
  end
end

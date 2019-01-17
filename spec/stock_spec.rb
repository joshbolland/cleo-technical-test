require 'stock'

describe Stock do
  let(:stock) { described_class.new }

  describe '#initialize' do
    it 'Products attribute is an array object' do
      expect(stock.products).to be_an(Array)
    end

    it 'Products are instances of the Product class' do
      expect(stock.products[2]).to be_an_instance_of(Product)
    end
  end
end

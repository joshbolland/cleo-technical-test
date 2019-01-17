require 'product'

describe Product do
  describe '#initialize' do
    it 'Product has a name' do
      fanta = Product.new('Fanta', 150, 20)
      expect(fanta.name).to eq 'Fanta'
    end

    it 'Product costs something' do
      fanta = Product.new('Fanta', 150, 20)
      expect(fanta.price).to eq 150
    end

    it 'Product has a quantity' do
      fanta = Product.new('Fanta', 150, 20)
      expect(fanta.quantity).to eq 20
    end
  end
end

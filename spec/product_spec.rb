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

  describe '#vend' do
    it 'Product quantity goes down by one' do
      fanta = Product.new('Fanta', 150, 20)
      expect { fanta.vend }.to change { fanta.quantity }.from(20).to(19)
    end
  end

  describe '#reload' do
    it 'Product quantity goes up by 10' do
      fanta = Product.new('Fanta', 150, 10)
      expect { fanta.reload(10) }.to change { fanta.quantity }.from(10).to(20)
    end
  end
end

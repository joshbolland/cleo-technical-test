require 'reload'

describe Reload do
  let(:reload) { described_class.new(Stock.new, Change.new) }

  describe '#initialize' do
    it 'Message attribute is an instance of Message' do
      expect(reload.message).to be_an_instance_of(Message)
    end

    it 'Stock attribute is an instance of Stock' do
      expect(reload.stock).to be_an_instance_of(Stock)
    end

    it 'Change attribute is an instance of Change' do
      expect(reload.change).to be_an_instance_of(Change)
    end
  end
end

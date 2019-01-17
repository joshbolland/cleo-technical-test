require 'machine'

describe Machine do
  let(:machine) { described_class.new }

  describe '#initialize' do
    it 'Stock attribute is an instance of the stock model' do
      machine = Machine.new
      expect(machine.stock).to be_an_instance_of(Stock)
    end

    it 'Change property is an instance of Change' do
      machine = Machine.new
      expect(machine.change).to be_an_instance_of(Change)
    end

    it 'Selection property is nil by default' do
      machine = Machine.new
      expect(machine).to have_attributes(selection: nil)
    end

    it 'Message attribute is an instance of the message model' do
      expect(machine.message).to be_an_instance_of(Message)
    end
  end
end

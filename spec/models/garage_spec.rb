RSpec.describe GarageInventory::Models::Garage do

  describe '#initialize' do

    let(:options) { {} }

    subject { described_class.new(options) }

    context "with default options" do

      its(:name)     { is_expected.to eq('') }
      its(:size)     { is_expected.to eq(0) }
      its(:capacity) { is_expected.to eq(0) }

    end

    context "with custom options" do

      let(:options) { { name: 'my_garage', size: 10, capacity: 3 } }

      its(:name)     { is_expected.to eq(options[:name]) }
      its(:size)     { is_expected.to eq(options[:size]) }
      its(:capacity) { is_expected.to eq(options[:capacity]) }

    end

  end

end

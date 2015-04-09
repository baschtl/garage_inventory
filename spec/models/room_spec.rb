RSpec.describe GarageInventory::Models::Room do

  describe '#initialize' do

    subject { described_class.new(options) }

    context "with default options" do

      let(:options) { {} }

      its(:name)     { is_expected.to eq('') }
      its(:size)     { is_expected.to eq(0) }
      its(:tools)    { is_expected.to be_empty }

    end

    context "with custom options" do

      let(:options) { { name: 'my_room', size: 10 } }

      its(:name)     { is_expected.to eq(options[:name]) }
      its(:size)     { is_expected.to eq(options[:size]) }
      its(:tools)    { is_expected.to be_empty }

    end

  end

end

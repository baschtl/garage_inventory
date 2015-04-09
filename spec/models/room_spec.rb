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

  describe 'adding tools' do

    let(:room)       { described_class.new }
    let(:tool)       { 'screwdriver' }
    let(:attributes) { { size: 1, type: :philips } }

    subject { room.send(tool, attributes) }

    it "allows adding of arbitrary tools" do
      expect {
        subject
      }.to change { room.tools.size }.by(1)
    end

    context "added tool" do

      let(:added_tool)        { subject.first }
      let(:actual_attributes) { added_tool.to_h }

      it "has the expected attributes set" do
        expect(actual_attributes).to eq(attributes)
      end

    end

  end

end

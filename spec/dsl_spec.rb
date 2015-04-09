RSpec.describe GarageInventory::Dsl do

  describe '#garage' do

    let(:dsl)     { described_class.new }
    let(:options) { { name: 'my_garage', size: 10, capacity: 3 } }

    subject { dsl.garage(options) }

    it "adds a new item" do
      expect {
        subject
      }.to change { dsl.garages.size }.by(1)
    end

    it "adds a new item of type garage" do
      subject

      expect(dsl.garages.first).to be_an_instance_of(GarageInventory::Models::Garage)
    end

    context "added item" do

      let(:actual_attributes) { { name: subject.name, size: subject.size, capacity: subject.capacity } }

      subject { dsl.garages.first }

      before do
        dsl.garage(options)
      end

      it "has the expected options set" do
        expect(actual_attributes).to eq(options)
      end

    end

  end

end

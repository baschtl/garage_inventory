RSpec.describe GarageInventory::Dsl do

  shared_examples_for 'a garage adder' do

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

      let(:added_garage)      { subject.first }
      let(:actual_attributes) { { name: added_garage.name, size: added_garage.size, capacity: added_garage.capacity } }

      it "has the expected options set" do
        expect(actual_attributes).to eq(options)
      end

    end

  end

  describe '#initialize_with_file' do

    let(:file_path) { File.join(File.dirname(__FILE__), 'fixtures', 'sample_dsl_definition.rb') }

    let(:dsl)     { described_class.new }
    let(:options) { { name: 'my_garage', size: 10, capacity: 3 } }

    it_behaves_like 'a garage adder' do
      subject { dsl.initialize_with_file(file_path) }
    end

  end

  describe '#garage' do

    let(:dsl)     { described_class.new }
    let(:options) { { name: 'my_garage', size: 10, capacity: 3 } }

    it_behaves_like 'a garage adder' do
      subject { dsl.garage(options) }
    end

  end

end

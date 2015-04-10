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

    subject { dsl.initialize_with_file(file_path) }

    it_behaves_like 'a garage adder'

    context "the garage" do

      let(:garage) { dsl.garages.first }

      it "has two rooms" do
        subject

        expect(garage.rooms.size).to eq(2)
      end

      context "the first room" do

        let(:room)             { garage.rooms.first }
        let(:expected_options) { { name: 'truck hall', size: 150 } }

        it "has the expected options set" do
          subject

          expect({ name: room.name, size: room.size }).to eq(expected_options)
        end

        it "has a screwdriver" do
          subject

          expect(room.tools[0].to_h).to eq({ name: 'screwdriver', size: 16, type: :phillips })
        end

        it "has a car lift" do
          subject

          expect(room.tools[1].to_h).to eq({ name: 'car_lift', lifting_capacity: 5000 })
        end

        it "has a brake test bench" do
          subject

          expect(room.tools[2].to_h).to eq({ name: 'brake_test_bench' })
        end

      end

      context "the second room" do

        let(:room)             { garage.rooms[1] }
        let(:expected_options) { { name: 'car hall', size: 100 } }

        it "has the expected options set" do
          subject

          expect({ name: room.name, size: room.size }).to eq(expected_options)
        end

        it "has an AC service" do
          subject

          expect(room.tools[0].to_h).to eq({ name: 'ac_service' })
        end

        it "has a balancing machine" do
          subject

          expect(room.tools[1].to_h).to eq({ name: 'balancing_machine', max_tire_size: 50 })
        end

      end

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

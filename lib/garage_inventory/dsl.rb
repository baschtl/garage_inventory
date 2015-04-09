module GarageInventory

  class Dsl

    attr_accessor :garages

    def initialize
      @garages ||= []
    end

    def initialize_with_file(path_to_file)
      instance_eval(File.read(path_to_file), path_to_file)
    end

    def garage(options, &block)
      @garages << Models::Garage.new(options, &block)
    end

  end

end

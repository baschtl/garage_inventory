module GarageInventory
  module Models

    class Garage

      attr_accessor :name, :size, :capacity

      def initialize(options, &block)
        options = defaults.merge(options)

        @name     = options[:name]
        @size     = options[:size]
        @capacity = options[:capacity]

        instance_eval(&block) if block
      end

      private

      def defaults
        { name: '', size: 0, capacity: 0 }
      end

    end

  end
end

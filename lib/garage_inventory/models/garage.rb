module GarageInventory
  module Models

    class Garage

      attr_accessor :name, :size, :capacity, :rooms

      def initialize(options = {}, &block)
        options = defaults.merge(options)

        @name       = options[:name]
        @size       = options[:size]
        @capacity   = options[:capacity]
        @rooms    ||= []

        instance_eval(&block) if block
      end

      def room(options, &block)
        @rooms << Room.new(options, &block)        
      end

      private

      def defaults
        { name: '', size: 0, capacity: 0 }
      end

    end

  end
end

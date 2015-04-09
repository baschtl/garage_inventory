module GarageInventory
  module Models

    class Room

      attr_accessor :name, :size, :tools

      def initialize(options = {}, &block)
        options = defaults.merge(options)

        @name       = options[:name]
        @size       = options[:size]
        @tools    ||= []
      end

      private

      def defaults
        { name: '', size: 0 }
      end

    end

  end
end

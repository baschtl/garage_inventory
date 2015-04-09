require "garage_inventory/version"

module GarageInventory

  class Dsl

    def garage(&block)
      instance_eval(&block) if block
    end

  end

end

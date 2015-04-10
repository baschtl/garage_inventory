# Garage Inventory Dsl

I wanted to try out writing an internal DSL in Ruby. What I came up with is an inventory DSL for garages. It supports adding garages. Each garage can have multiple rooms. Finally, a room consists of multiple tools that can be defined without restrictions.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'garage_inventory', git: 'https://github.com/baschtl/garage_inventory.git'
```

And then execute:

    $ bundle

## Usage

Have a look at the specs. The most interesting one is probably the [DSL spec](https://github.com/baschtl/garage_inventory/blob/master/spec/dsl_spec.rb). It tests that a [sample definition](https://github.com/baschtl/garage_inventory/blob/master/spec/fixtures/sample_dsl_definition.rb) was read properly.

For the curious ones out there, here is how a definition might look like:

```ruby
garage name: 'my_garage', size: 10, capacity: 3 do
  
  room name: 'truck hall', size: 150 do
    screwdriver       size: 16, type: :phillips
    car_lift          lifting_capacity: 5000
    brake_test_bench
  end

  room name: 'car hall', size: 100 do
    ac_service
    balancing_machine max_tire_size: 50
  end

end
```

A definition is then loaded with:

```ruby
  inventory = GarageInventory::Dsl.new
  inventory.initialize_with_file(path_to_file)
```

## Contributing

1. Fork it ( https://github.com/baschtl/garage_inventory/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

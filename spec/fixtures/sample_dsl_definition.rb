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

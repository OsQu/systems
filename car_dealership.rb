require './entities/system'

car_dealership = Systems.define do |s|
  factory = s.source(:factory, rate: 1)
  deal = s.sink(:deal, rate: 1)
  inventory = s.stock(:inventory)

  inventory.add_source factory
  inventory.add_sink deal
end

car_dealership.run(100)

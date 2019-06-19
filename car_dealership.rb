require './entities/system'

car_dealership = Systems.define do |s|
  factory = s.flow(:factory, rate: 1)
  deal = s.flow(:deal, rate: 1)
  inventory = s.stock(:inventory)

  inventory.add_source factory
  inventory.add_sink deal
end

car_dealership.run(100)

require 'bike_container'

class DockingStation

  include BikeContainer

  def initialize(options = {})
	self.capacity = options.fetch(:capacity, capacity)
  end

  def available_bikes
    bikes.reject { |bike| bike.broken? }
  end
end
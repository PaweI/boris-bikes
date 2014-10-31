module BikeContainer

DEFAULT_CAPACITY = 10

def bikes
  @bikes ||= []
end

def capacity
  @capacity ||= DEFAULT_CAPACITY
end

def capacity=(value)
  @capacity = value
end

def bike_count
  bikes.count
end

def dock(bike)
  bikes << bike
end

def release
  bikes.each { |bike| bikes.delete(bike) if !bike.broken? }
end

def full?
  bike_count == capacity
end


def transfer_broken_to(place)
  bikes.each { |bike| place.dock(bike) if bike.broken? }
end

def transfer_fixed_to(place)
  bikes.each { |bike| place.dock(bike) if !bike.broken? }
end

def available_bikes
  bikes.reject { |bike| bike.broken? }
end
end

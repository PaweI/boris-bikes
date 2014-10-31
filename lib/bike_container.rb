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

def release(bike)
  bikes.delete(bike) if !bike.broken?
end

def full?
  bike_count == capacity
end


def transfer_to(place)
  bikes.each do |bike|
    release(bike)
    place.dock(bike) if bike.broken?
  end
end
end

class DockingStation

  attr_accessor :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(options = {})
    @bikes = []
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
  end

  def full?
  end

  def dock(bike)
    @bikes << bike
  end

  def release(bike)
    @bikes.delete(bike) if !bike.broken?
  end

end
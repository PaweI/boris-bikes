class DockingStation

  attr_accessor :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(options = {})
    @bikes = []
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
  end

  def full?
    @capacity == @bikes.size
  end

  def dock(bike)
    @bikes << bike
  end

  def release(bike)
    @bikes.delete(bike) if !bike.broken?
  end

  def transfer_to(van)
    @bikes.each do |bike| 
      @bikes.delete(bike) if bike.broken?
      van.dock(bike) if bike.broken?
    end
  end

end
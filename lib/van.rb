class Van

  attr_accessor :bikes

  def initialize
    @bikes = []
  end

  def collect(bike)
    @bikes << bike if bike.broken?
  end

  def full?
    false
  end

 
 # def release_to_docking_station(bike)
 #    @bikes.delete(bike) 
 #  end
end


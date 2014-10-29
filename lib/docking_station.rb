require 'bike'

class Docking_station

  def initialize
    @bikes = 0
  end

  def bike_count
    @bikes 
  end

  def dock(bike)
    @bikes = 1
  end

end
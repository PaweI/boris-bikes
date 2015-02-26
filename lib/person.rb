class Person
  attr_reader :bike

  def initialize(bike = 0)
    @bike = bike
  end

  def has_bike?
    @bike
  end

  def fall_down!
    @bike.break!
  end

  def lose_bike!
    @bike = false
  end

  def rent_bike_from(station)
    @bike = station.release
  end

  def return_bike(station)
    lose_bike!
    station.dock
  end
end

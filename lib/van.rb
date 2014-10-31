class Van

  include BikeContainer

  def collect(bike)
    @bikes << bike if bike.broken?
  end

end


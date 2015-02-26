class Bike
  attr_reader :broken

  def initialize
    fix!
  end

  def break!
    @broken = true
  end

  def fix!
    @broken = false
  end
end

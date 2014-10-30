class Person

attr_accessor :bike

def initialize
	@bike = []
	@capacity = 1
end

def has_bike?
	@bike.size == @capacity
end

def request(bike)
	@bike << bike
end

def damage!(bike)
	bike.break!
end


def return(bike)
	@bike.pop
end



end
class Garage 

	include BikeContainer


	def accept(bike)
		bike.fix!
		dock(bike)
	end


	def transfer_to(van)
		@bikes.each do |bike|
			bikes.delete(bike) if !bike.broken?
			van.dock(bike) if !bike.broken?
		end
	end
end
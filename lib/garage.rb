class Garage 
	
	include BikeContainer


	def repair(bike)
		bike.fix!
	end


	def transfer_to(van)
		@bikes.each do |bike|
			bikes.delete(bike) if !bike.broken?
			van.dock(bike) if !bike.broken?
		end
	end
end
require 'garage'

describe Garage do 
	let(:garage)		  {Garage.new}
	let(:bike)			  {double :bike, broken?: false}
	let(:bike_broken)	{double :bike, broken?: true}
	let(:van)		    	{double :van}

	it 'will receive broken bikes' do
		expect(garage.bikes.count).to eq(0)
		garage.dock(bike_broken)
		expect(garage.bikes.count).to eq(1)
	end

	it 'will fix broken bikes' do
		expect(bike_broken).to receive(:fix!)
		garage.accept(bike_broken)
		
	end 

	it 'will release fixed bikes to the van' do
		garage.dock(bike)
		expect(van).to receive(:dock).with(bike)
		garage.transfer_to(van)

	end


end
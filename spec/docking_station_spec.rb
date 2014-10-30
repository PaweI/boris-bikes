require 'docking_station'

describe DockingStation do
	let(:station){DockingStation.new}
	let(:bike){double :bike, broken?: false}
	let(:bike_broken){double :bike, broken?: true}
	let(:van){double :van}


def fill_station(bike)
	20.times { station.dock(bike) }	
end

	it 'has a default capacity' do
		expect(station.capacity).to eq(20)
		fill_station(bike)
		expect(station).to be_full
		station.dock(bike)
		expect(station).not_to be_full
	end

	it 'holds bikes' do
		expect(station.bikes.count).to eq(0)
		station.dock(bike)
		expect{station.dock(bike)}.to change{station.bikes.count}.by 1
	end


	context 'release bikes' do


		it 'will release bike if not broken' do
			station.dock(bike)
			station.dock(bike_broken)
			expect(station.bikes.count).to eq(2)
			station.release(bike)
			expect{station.dock(bike)}.to change{station.bikes.count}.by 1
		end

		it 'will NOT release broken bikes' do
			station.dock(bike_broken)
			expect(station.bikes.count).to eq(1)
			station.release(bike_broken)
			expect(station.bikes.count).to eq(1)
		end
		

		it 'will transfer the broken bike to a van' do
			station.dock(bike_broken)
			station.dock(bike)
			expect(van).to receive(:dock).with(bike_broken)
			station.transfer_to(van)
		end 


	end




end
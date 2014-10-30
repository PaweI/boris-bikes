require 'person'

describe Person do
	let(:person)          {Person.new}
	let(:bike)            {double :bike, broken?: false}
	let(:bike_broken)     {double :bike, broken?: true}
	# let(:station)					{double :station}


	it 'can rent a bike' do
		expect(person).not_to have_bike
		person.request(bike)
		expect(person).to have_bike
	end



	it 'can break a bike' do
		person.request(bike)
		expect(person).to have_bike
		allow(bike).to receive(:break!)
		person.damage!(bike)	
	end

	it 'can return a bike' do
		person.request(bike)
		expect(person).to have_bike
		person.return(bike)
	end




	
end





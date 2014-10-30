require 'docking_station'

describe  DockingStation do

  let(:station) {DockingStation.new}
  let(:bike) {double :bike, broken?: false}
  let(:broken_bike) {double :broken_bike, broken?: true}
  let(:van) {double :van}

  def fill_station(bike)
    20.times { station.dock(bike) }
  end

 it 'has a default capacity' do
  expect(station.capacity).to eq 20
  fill_station(bike)
  expect(station).to be_full

 end

 it 'can hold bikes' do 
  expect(station.bikes.size).to eq 0
  station.dock(bike)
  expect(station.bikes.size).to eq 1

 end

context 'release bike' do 

 it 'will release a bike if it not broken' do
  station.dock(bike)
  expect{station.release(bike)}.to change{station.bikes.count}.by -1
 end

 it 'will NOT release broken bike' do
  station.dock(broken_bike)
  station.release(broken_bike)
  expect(station.bikes.count).to eq 1
 end

 it 'will release broken bike to a van' do 
  station.dock(broken_bike)
  station.dock(bike)
  expect(van).to receive(:dock).with(broken_bike)
  station.transfer_to(van)
  expect(station.bikes).to eq [bike]



 end
end 
end
require 'docking_station'

describe  DockingStation do

  let(:station) {DockingStation.new}
  let(:bike) {double :bike, broken?: false}
  let(:broken_bike) {double :broken_bike, broken?: true}

 it 'has a default capacity' do
  expect(station.capacity).to eq 20

 end

 it 'can hold bikes' do 
  expect(station.bikes.size).to eq 0
  station.dock(bike)
  expect(station.bikes.size).to eq 1

 end

context 'release bike' do 

 it 'will release a bike if it not broken' do
  station.dock(bike)
  station.release(bike)
  expect(station.bikes.count).to eq 0
 end

 it 'will NOT release broken bike' do
  station.dock(broken_bike)
  station.release(broken_bike)
  expect(station.bikes.count).to eq 1
 end
end
end
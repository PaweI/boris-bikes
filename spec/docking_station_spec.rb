require 'docking_station'

describe Docking_station do

  def fill_station(station)
    20.times { station.dock(:bike) }
  end

  let(:bike) { double :bike, broken?: false }    
  let(:bike2) { double :bike2, broken?: true }      
  let(:station) { Docking_station.new(:capacity => 20) }

  it 'should accept a bike' do 
    expect(station.bike_count).to eq 0
    station.dock(bike)
    expect(station.bike_count).to eq 1
  end

  it 'should release a bike' do
    station.dock(bike)
    station.release(bike)
    expect(station.bike_count). to eq 0
  end

  it 'should not release a bike if there is no available bikes' do 
    expect { station.release(bike) }.to raise_error(RuntimeError)

  end

  it 'should know when it\'s full' do 
    expect(station).not_to be_full
    fill_station(station)
    expect(station).to be_full
  end

  it 'should not accept a bike if it\'s full' do 
    fill_station(station)
    expect(lambda {station.dock(bike) }).to raise_error(RuntimeError)
  end

  it 'should provide list of available bikes' do 
    station.dock(bike)
    station.dock(bike2)
    expect(station.available_bikes).to eq ([bike])
  end
end
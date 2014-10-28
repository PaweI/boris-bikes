require 'docking_station'

describe Docking_station do
  it 'shows that there bikes avaliable' do 
    ask = Docking_station.new
    expect(ask.bikes).to eq "Bikes avaliable to collect!"
  end

  it 'can be broken' do
    ask = Docking_station.new
    expect(ask.brake!).to eq false
  end

  it 'can be fixed' do
  end


end
require 'van'

describe Van do

  let(:van)            { Van.new                             }
  let(:broken_bike)    { double :broken_bike, broken?: true  }
  let(:bike)           { double :bike, broken?: false        }
  let(:station)        { DockingStation.new                  }
  let(:garage)         { double :garage                      } 

  def fill_van
    10.times 
  end

  it 'has no bikes when starting' do
    expect(van).not_to be_full
    expect(van.full?).to be false
  end

  it 'collect broken from station' do
    station.dock(bike)
    expect{station.transfer_broken_to(van)}.to change {van.bikes.count}.by 0
    station.dock(broken_bike)
    station.transfer_broken_to(van)
    expect(station.bikes.count).to eq 1
  end

  it 'put fixed bike back to docking station' do
    van.dock(bike)
    expect {van.transfer_fixed_to(station)}.to change { station.bikes.count }.by 1
  end

  it 'docking broken bike to garage' do
    van.dock(broken_bike)
    expect(garage).to receive(:dock)
    expect{van.transfer_broken_to(garage)}.to change {van.bikes.count}.by -1
  end
end
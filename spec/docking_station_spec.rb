require 'docking_station'

describe DockingStation do
  let(:station)        { DockingStation.new           }
  let(:bike)           { double :bike, broken?: false }
  let(:bike_broken)    { double :bike, broken?: true  }
  let(:van)            { double :van                  }

  def fill_station(bike)
    10.times { station.dock(bike) }
  end

  it 'has a default capacity' do
    expect(station.capacity).to eq(10)
    fill_station(bike)
    expect(station).to be_full
    station.dock(bike)
    expect(station).not_to be_full
  end

  it 'holds bikes' do
    expect(station.bikes.count).to eq(0)
    expect { station.dock(bike) }.to change { station.bikes.count }.by 1
  end

  context 'release bikes' do
    it 'will release bike if not broken' do
      station.dock(bike)
      expect { station.dock(bike_broken) }.to change { station.bikes.count }.by 1
      station.release(bike)
      expect { station.dock(bike) }.to change { station.bikes.count }.by 1
    end

    it 'will NOT release broken bikes' do
      expect { station.dock(bike_broken) }.to change { station.bikes.count }.by 1
      expect { station.release(bike) }.to change { station.bikes.count }.by 0
    end

    it 'will transfer the broken bike to a van' do
      station.dock(bike_broken)
      station.dock(bike)
      expect(van).to receive(:dock).with(bike_broken)
      station.transfer_broken_to(van)
    end

    it 'shows available bikes' do
      station.dock(bike)
      station.dock(bike_broken)
      expect(station.available_bikes).to eq([bike])
    end
  end
end

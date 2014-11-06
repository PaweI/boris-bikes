require 'bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do    
  let(:bike)      { double :bike        }
  let(:holder)    { ContainerHolder.new }

  it 'should accept a bike' do

    expect(holder.bike_count).to eq(0)
    expect { holder.dock(bike) }.to change { holder.bike_count }.by 1
  end
end
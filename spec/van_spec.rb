require 'van'

describe Van do

  let(:van)            { Van.new             }
  let(:broken_bike)    { double :broken_bike }
  let(:bike)           { double :bike        }

  it 'has no bikes when starting' do
    expect(van).not_to be_full
    expect(van.full?).to be false
  end

  it 'collect broken from station' do
    expect(bike).to receive(:broken?).and_return(false, true)
    van.collect(bike)
    expect(van.bikes.count).to eq 0
    van.collect(bike)
    expect(van.bikes.count).to eq 1
  end

  it 'put fixed bike back to docking station' do 
  

  end

  it 'docking broken bike to garage' do 


  end






end
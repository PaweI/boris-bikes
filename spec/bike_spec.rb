require 'bike'

describe Bike do
  let(:bike) { Bike.new }

  it 'is not broken when created' do
    expect(bike.broken).to be false
  end

  it 'can be broken and fixed' do
    expect(bike.break!).to be true
  end

  it 'broken bike can be fixed' do
    bike.break!
    expect(bike.fix!).to be false
  end
end

require 'station'

describe Station do

    it 'should create a new station' do
        new_station = Station.new("Old Street", 5)
        expect(new_station.zone).to eq 5
        expect(new_station.name).to eq "Old Street"
    end

end
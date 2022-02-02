require_relative '../lib/station'

describe Station do

  subject(:station) { subject.new("Waterloo") }
  
  describe "#name" do
    it "should have a station name" do
      expect(station.name).to eq "Waterloo" 
    end
  end
  
end
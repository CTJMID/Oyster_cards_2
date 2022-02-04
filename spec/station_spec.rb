require_relative '../lib/Station'

describe Station do
# it {is_expected.to respond_to :initialize}
# it {is_expected.to respond_to(:initialize).with(2).arguments}

# let(:station) {double (:station), :name => name, :zone => zone}

  describe "#name" do
    station = Station.new("Waterloo", 1)

    it "should give us a name on the class creation" do
      expect(station.name).to eq "Waterloo"
    end

    it "should expect the zone to equal 1" do
      expect(station.zone).to eq 1
    end
      

  end












end
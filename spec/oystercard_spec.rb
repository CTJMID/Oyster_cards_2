require_relative '../lib/Oystercard'

describe Oystercard do

  it {is_expected.to respond_to(:top_up).with(1).argument}
  it {is_expected.to respond_to(:touch_in).with(1).argument}
  it {is_expected.to respond_to(:touch_out).with(1).argument}
  it {is_expected.to respond_to :balance}
  it {is_expected.to respond_to :in_journey?}
  
  describe "#balance" do

    it "should check a card has a balance" do
      expect(subject.balance).to eq 0 
    end

  end

  describe "#top_up" do

    it "should top up money on an oyster card" do 
      expect{ subject.top_up(1)}.to change{ subject.balance }.by 1
    end

    it "should raise error if top up amount > 90" do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up maximum_balance
      expect{ subject.top_up(1) }.to raise_error "Maximum balance #{maximum_balance} exceeded"
    end

  end
  
  describe "#in_journey" do

    it "is initially not in a journey" do
      expect(subject).not_to be_in_journey
    end

  end 

  describe '#touch_in' do 

    let(:station){ double (:station) }

    it "can touch in" do
      subject.top_up(1)
      subject.touch_in(station)
      expect(subject).to be_in_journey
    end
    
    it "gives error message if below minimum amount" do
      expect{subject.touch_in(station)}.to raise_error "minimum amount needed, £1"
    end

  end

  describe '#touch_out' do
    let(:station){ double (:station) }

    it "checks a charge is made on touch out" do 
      subject.top_up(1)
      subject.touch_in(station)
      subject.touch_out(station)
      expect{ subject.touch_out(station)}.to change {subject.balance}.by(-Oystercard::MINIMUM_BALANCE)
    end
    
    it "checks that entry station is set to nil after touch out" do
      subject.top_up(1)
      subject.touch_in(station)
      expect {subject.touch_out(station)}.to change {subject.current_journey}.to ({})
    end

    it "stores the entry station" do
      subject.top_up(1)
      subject.touch_in(:station)
      expect(subject.current_journey).to eq ({:entry => :station})
    end

    it "stores the journey" do
      subject.top_up(1)
      subject.touch_in(:station)
      subject.touch_out(:station)
      expect(subject.journey_history).to eq([{:entry => :station, exit => :station}])
    end
  
    it 'makes checks that journey is empty' do
      expect(subject.journey_history).to eq([])
    end

  end
end

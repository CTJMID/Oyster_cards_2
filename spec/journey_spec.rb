require_relative '../lib/journey'

describe Journey do
  
    describe '#initalize' do
      let(:station){double(:station)}
      subject{described_class.new(station)}

      it 'should accept a parameter on creation and convert to entry_station variable' do
        expect(subject.entry).to eq [station]
      end

    end

    describe '#finish' do
      let(:station){double(:station)}
      subject{described_class.new(station)}

      it 'should accept an exit station' do
      subject.finish(station)
      expect(subject.exit).to eq [station]
      end

    end

    describe '#complete?' do
      let(:station){double(:station)}
      subject{described_class.new(station)}

      it 'should be complete when both exit & entry stations' do
        subject.finish(station)
        expect(subject).to be_complete
      end

      it 'should not be complete when just entry station' do
        expect(subject).not_to be_complete
      end

    end

    describe '#fare' do
      let(:station){double(:station)}
      subject{described_class.new(station)}

      it 'should return 1 if journey is complete' do
        allow(subject).to receive(:complete?).and_return(true)
        expect(subject.fare).to eq (1)
      end

      it 'should return 6 if journey is not complete' do
        allow(subject).to receive(:complete?).and_return(false)
        expect(subject.fare).to eq (6)
      end

    end
end
      
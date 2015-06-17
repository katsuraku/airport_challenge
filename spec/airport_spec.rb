require 'airport'

## Note these are just some guidelines!
## Feel free to write more tests!!

# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport
# and how that is implemented.
#
# If the airport is full then no planes can land

describe Airport do

  it { is_expected.to respond_to(:capacity) }
  let(:plane) { double(:plane, { land: 'argument placeholder' }) }

  describe 'release_plane' do
    it { is_expected.to respond_to(:release_plane).with(1).argument }

    it 'instructs a plane to take off' do
      # SETUP
      # EXPECTATION ABOUT THE FUTURE
      expect(plane).to receive :takeoff
      # ACTION
      subject.release_plane(plane)
    end
  end

  describe 'receive_plane' do

    it { is_expected.to respond_to(:receive_plane).with(1).argument }

    it 'raises an error when full' do
      allow(subject).to receive(:stormy?).and_return(false)
      subject.capacity.times { subject.receive_plane plane }

      expect { subject.receive_plane plane }.to raise_error 'Airport is full'
    end

    it 'raises an error when weather is stormy' do
      allow(subject).to receive(:stormy?).and_return true
      expect {subject.receive_plane plane }.to raise_error 'Cannot land due to weather'
    end

    it 'adds a landed plane into the array of planes' do
      allow(subject).to receive(:stormy?).and_return(false)
      expect { subject.receive_plane plane }.to change{ subject.planes.size }.from(0).to(1)
    end 

  end
  
end

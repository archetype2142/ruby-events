# frozen_string_literal: true

require 'rspec'
require_relative '../event'

RSpec.describe Event do
  let(:event) { Event.new('Conference', max_capacity) }
  let(:participant1) { Participant.new('Alice') }
  let(:participant2) { Participant.new('Bob') }
  let(:participant3) { Participant.new('Charlie') }
  let(:max_capacity) { 2 }

  describe '#initialize' do
    it 'creates an event with a name and max capacity' do
      expect(event.name).to eq('Conference')
      expect(event.max_capacity).to eq(2)
      expect(event.participants).to eq([])
    end
  end

  describe '#register_participant' do
    before { event.register_participant(participant1) }

    context 'when capacity has not reached maximum' do
      it 'registers a participant' do
        expect(event.participants).to include(participant1)
      end
    end

    context 'when capacity is reached' do
      let(:max_capacity) { 1 }

      it 'does not register a participant if capacity is exceeded' do
        expect { event.register_participant(participant3) }.to raise_error(EventFullError)
        expect(event.participants).not_to include(participant3)
      end
    end

    context 'when an existing participant is registered again' do
      it 'does not register the participant again' do
        expect { event.register_participant(participant1) }.to raise_error(AlreadyRegisteredError)
        expect(event.participants).not_to include(participant3)
      end
    end
  end

  describe '#full?' do
    it 'returns true if the event is full' do
      event.register_participant(participant1)
      event.register_participant(participant2)
      expect(event.full?).to be true
    end

    it 'returns false if the event is not full' do
      expect(event.full?).to be false
    end
  end
end

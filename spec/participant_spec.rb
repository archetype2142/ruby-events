# frozen_string_literal: true

require 'rspec'
require_relative '../participant'

RSpec.describe Participant do
  let(:participant) { Participant.new('Alice') }
  let(:event) { Event.new('Conference', 100) }

  describe '#initialize' do
    it 'creates a participant with a name' do
      expect(participant.name).to eq('Alice')
      expect(participant.registered_events).to eq([])
    end
  end

  describe '#register_event' do
    it 'registers an event for the participant' do
      participant.register_event(event)
      expect(participant.registered_events).to include(event)
    end
  end

  describe '#registered_for_event?' do
    it 'returns true if participant is registered for the event' do
      participant.register_event(event)
      expect(participant.registered_for_event?(event)).to be true
    end

    it 'returns false if participant is not registered for the event' do
      expect(participant.registered_for_event?(event)).to be false
    end
  end

  describe '#registered_events' do
    before { participant.register_event(event) }

    it 'returns an array of registered events for the user' do
      expect(participant.registered_events).to include(event)
    end
  end
end

# frozen_string_literal: true

require 'rspec'
require_relative '../event_organizer'
require_relative '../event'
require_relative '../participant'

RSpec.describe EventOrganizer do
  let(:organizer) { EventOrganizer.new }
  let(:event1) { organizer.create_event('Conference', 100) }
  let(:event2) { organizer.create_event('Tech Meetup', 50) }
  let(:participant1) { Participant.new('Alice') }
  let(:participant2) { Participant.new('Bob') }
  let(:participant3) { Participant.new('Charlie') }

  describe '#initialize' do
    it 'creates an event organizer with no events initially' do
      expect(organizer.events).to eq([])
    end
  end

  describe '#create_event' do
    it 'creates and adds a new event to the organizer' do
      event = organizer.create_event('New Event', 10)
      expect(organizer.events).to include(event)
    end
  end

  describe '#list_event_participants' do
    it 'lists all participants for a specific event' do
      event1.register_participant(participant1)
      event1.register_participant(participant2)
      expect(organizer.list_event_participants(event1)).to contain_exactly('Alice', 'Bob')
    end
  end
end

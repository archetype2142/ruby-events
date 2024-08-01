# frozen_string_literal: true

class EventOrganizer
  attr_reader :events

  def initialize
    @events = []
  end

  def create_event(name, max_capacity)
    event = Event.new(name, max_capacity)
    @events << event
    event
  end

  def list_event_participants(event)
    event.participants.map(&:name)
  end
end

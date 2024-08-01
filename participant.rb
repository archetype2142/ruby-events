# frozen_string_literal: true

class Participant
  attr_reader :name, :registered_events

  def initialize(name)
    @name = name
    @registered_events = []
  end

  def register_event(event)
    @registered_events << event
  end

  def registered_for_event?(event)
    @registered_events.include?(event)
  end
end

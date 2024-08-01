# frozen_string_literal: true

class EventFullError < StandardError; end
class AlreadyRegisteredError < StandardError; end

class Event
  attr_reader :name, :max_capacity, :participants

  def initialize(name, max_capacity)
    @name = name
    @max_capacity = max_capacity
    @participants = []
  end

  def full?
    @participants.length >= @max_capacity
  end

  def register_participant(participant)
    raise EventFullError, "#{@name} is full" if full?
    raise AlreadyRegisteredError, 'Participant already registered' if @participants.include?(participant)

    @participants << participant
    participant.register_event(self)
  end
end

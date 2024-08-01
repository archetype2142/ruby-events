# frozen_string_literal: true

require './event'
require './event_organizer'
require './participant'

# Create an event organizer
organizer = EventOrganizer.new

# Organizer creates a new event
event1 = organizer.create_event('Ruby Conference', 100)
event2 = organizer.create_event('Tech Meetup', 1)

# Create participants
participant1 = Participant.new('Alice')
participant2 = Participant.new('Bob')
participant3 = Participant.new('Charlie')

# Participants register for events
event1.register_participant(participant1)
event1.register_participant(participant2)
event2.register_participant(participant3)
# event2.register_participant(participant1)

# Organizer checks participants of an event
puts "Participants for Ruby Conference: #{organizer.list_event_participants(event1).join(', ')}"
puts "Participants for Tech Meetup: #{organizer.list_event_participants(event2).join(', ')}"

# Participants check their registered events
puts "Alice's registered events: #{participant1.registered_events.map(&:name).join(', ')}"
puts "Bob's registered events: #{participant2.registered_events.map(&:name).join(', ')}"
puts "Charlie's registered events: #{participant3.registered_events.map(&:name).join(', ')}"

require 'time'

TIMESTAMP = /^\d{4}-\d{2}-\d{2}\s\d{2}:\d{2}:\d{2}.\d/.freeze

def task3(logs1)
  lines = logs1.split(/\n/)
  events = []
  lines.map { |line| events << line[TIMESTAMP] if line.include?('Calling') }
  if events.size <= 1
    p '0'
  else
    calculate_diff(events)
  end
end

def calculate_diff(events)
  event1 = Time.parse(events[0])
  event2 = Time.parse(events[1])
  p diff = (event2 - event1).to_s
end

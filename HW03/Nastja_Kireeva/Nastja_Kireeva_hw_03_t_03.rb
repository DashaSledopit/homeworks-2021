require 'time'
TIMESTAMP = /^\d{4}-\d{2}-\d{2}\s\d{2}:\d{2}:\d{2}.\d/.freeze

def task3(logs)
  lines = logs.split(/\n/)
  events = []
  lines.map { |line| events << line[TIMESTAMP] if line.include?('Calling') }
  if events.size <= 1
    p '0'
  else
    calculate_diff(events)
  end
end

def calculate_diff(events)
  diff = []
  events.each_cons(2) do |previous_event, next_event|
    diff << Time.parse(next_event) - Time.parse(previous_event)
  end
  diff.join(',')
end

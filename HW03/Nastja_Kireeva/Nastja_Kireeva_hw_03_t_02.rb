DATETIME = /(?<=\[).*(?=\])/.freeze
IP = /^\d{2}.\d{1}.\d{3}.\d+/.freeze
ADDRESS = %r{/\w+/\d+/\w+}.freeze

def task2(logs)
  post_requests = []
  lines = logs.split(/\n/)

  lines.select { |line| line.include?('POST') }.map do |line|
    datetime = line.scan(DATETIME).first
    address = line.scan(ADDRESS).first.upcase
    ip = line.scan(IP).first
    post_requests << "#{datetime} FROM: #{ip} TO: #{address}"
  end

  post_requests
end

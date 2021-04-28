def task1(logs)
  error_line = logs.split(/\n/).find { |line| line.downcase.include?('error') }
  error_line.nil? ? '' : error_line
end

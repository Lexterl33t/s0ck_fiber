require 'socket'


file = ARGV[0]

s = TCPServer.new('127.0.0.1', 1337)

output = ARGV[0]
puts "Listening client....."
while true
  session = s.accept
  puts "News client enter in server"
  data = session.recv(4096)
  File.open(output, 'wb') do |line|
    line.write(data)
  end
end

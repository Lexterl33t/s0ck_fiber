class Server

  @@rport = nil

  def initialize(rport)
    if !rport.instance_of?(Integer)
      raise "Error: (Constructor) -> rport must be type Integer"
    else
      @@rport = rport
    end
  end

  def getFileName(data)
    signature_var = data.split("\n")
    return signature_var.last.split("#").join.split("\n").join
  end

  def start
    srv = TCPServer.new('0.0.0.0', @@rport)
    puts "Listening clients....".blue
    while true
      session = srv.accept
      puts "New clients: #{session.peeraddr.join(' ')}".yellow
      data = session.recv(4096)
      File.open(getFileName(data), 'wb') do |wrt|
        wrt << data
      end
    end
  end

end

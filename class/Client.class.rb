
class Client

  @@rhost = nil
  @@rport = nil
  @@path_file = nil
  @@basename = nil

  def initialize(rhost, rport, file)
    #variable rhost
    if rhost.empty?
      raise "Error: (Constructor) -> rhost is empty"
    elsif !rhost.instance_of?(String)
      raise "Error: (Constructor) -> rhost must be type String"
    elsif !IPAddress.valid_ipv4? rhost
      raise "Error: (Constructor) -> rhost must be ip v4 format"
    else
      @@rhost = rhost
    end

    #variable rport
    if !rport.instance_of?(Integer)
      raise "Error: (Constructor) -> rport must be type Integer"
    else
      @@rport = rport
    end

    #variable file
    if file.empty?
      raise "Error: (Constructor) -> file is empty :/"
    elsif !file.instance_of?(String)
      raise "Error: (Constructor) -> file must be type String"
    elsif !File.file?(file)
      raise "Error: (Constructor) -> Your path is not file :/"
    elsif !File.exist?(file)
      raise "Error: (Constructor) -> File path not found :/"
    else
      @@path_file = file
      @@basename = File.basename(file)
      self.addSignature
    end
  end

  def addSignature()
    File.open(@@path_file, 'a') do |sign|
      sign << "\n######{@@basename}"
    end
  end


  def start
    TCPSocket.open(@@rhost, @@rport) do |socket|

      begin
        File.open(@@path_file, 'rb') do |content_file|
          print "Sending to Server...."

          buffer = content_file.read
          socket.send buffer, 0
          sleep(1)
          print(" Send :)".green)

        end
      end
    end

  end


end

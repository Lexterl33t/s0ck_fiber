class ClientGeneral

  def help
    puts "Usage:"
    puts "ruby s0ck_fiber_client.rb <RHOST> <RPORT> <FILE>".blue
  end

  def main
    if ARGV.length == 3
      rhost, rport, file = ARGV
      if IPAddress.valid_ipv4? rhost
        if File.file?(file)
          client = Client.new(rhost, rport.to_i, file)
          client.start
        else
          puts "[x] ERROR: FILE not found".red
        end
      else
        puts "[x] ERROR: RHOST must be IP V4 format".red
      end
    else
      self.help
    end
  end
end

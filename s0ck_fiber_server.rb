=begin
  [ SQUELETTE ]
    Class
=end

require 'socket'
require 'colorize'
require_relative 'class/Server.class'
require_relative 'class/ServerGeneral.class'


if __FILE__ == $0
  server = Server.new 1337
  server.start
end

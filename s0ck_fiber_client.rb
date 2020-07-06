=begin
  [ FONCTIONNALITÉS ]
    - Envois de fichier par socket
=end

require 'socket'
require 'colorize'
require 'ipaddress'
require_relative 'class/Client.class'
require_relative 'class/ClientGeneral.class'


if __FILE__ == $0
  ClientMain = ClientGeneral.new
  ClientMain.main
end

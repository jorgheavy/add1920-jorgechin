#!/usr/bin/env ruby

def menu
  puts "CHange NETwork configuration"
  puts " r. Reset"
  puts " 1. Class"
  puts " 2. Home"
  print " Select option: "
  option = gets.chop

 if option == 'r'
    system ("ifdown eth0")
    sysetm ("ifup eth0")
  if option == '1'
    system ("ip addr add 172.19.11.33/16 dev eth0")
  if option == '2'
    system ("ip addr add 192.168.1.50/24 dev eth0")
end

menu

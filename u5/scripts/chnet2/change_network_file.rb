#!/usr/bin/env ruby

def menu
  puts "Change NETwork configuration"
  puts " 1. Dynamic"
  puts " 2. Class"
  puts " 3. Home"
  print " Select option: "
  option = gets.chop

if option == '1'
  system("sudo cp dynamic /etc/sysconfig/network/ifcfg-eth1")
  system("sudo ifdown eth1")
  system("sudo ifup eth1")

elsif option == '2'
  system("sudo cp class /etc/sysconfig/network/ifcfg-eth1")
  system("sudo ifdown eth1")
  system("sudo ifup eth1")

elsif option == '3'
  system("sudo cp home /etc/sysconfig/network/ifcfg-eth1")
  system("sudo ifdown eth1")
  system("sudo ifup eth1")
end
end

menu

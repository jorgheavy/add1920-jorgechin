#!/usr/bin/env ruby

require 'telegram/bot'

def get_network_information
  # Get network information
  data = {}
  items = %x[ip a | grep 'inet ' | grep -v 'host lo'].split
  data[:ip] = items[1]
  data[:device] = items.last

  items = %x[ip route | grep default].split
  data[:gateway] = items[2]

  ok = system('ping -c1 8.8.4.4 > /dev/null')
  data[:internet] = (ok ? 'Ok' : Rainbow('No access').red)
  ok = system('host www.nba.com > /dev/null')
  data[:dns] = (ok ? 'Ok' : Rainbow('No access').red)
  return data
end

# token:
# 1. Write your TOKEN value into "token" variable or
# 2. Create a local file "hiden.token" with your TOKEN value inside
token = `cat hide.token`.strip
bot_username = '@dvarrui_bot'

puts "[INFO] Running bot #{$0}..."

data = get_network_information()

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    puts " => #{message.text}"
    if message.text == "/device"
      bot.api.send_message(chat_id: message.chat.id, text: "el dispositivo es #{data[:device]}")
    elsif message.text == "/ip"
      bot.api.send_message(chat_id: message.chat.id, text: "el dispositivo es #{data[:ip]}")
    elsif message.text == "/gateway"
      bot.api.send_message(chat_id: message.chat.id, text: "el dispositivo es #{data[:gateway]}")
    elsif message.text == "/dns"
      bot.api.send_message(chat_id: message.chat.id, text: "el dispositivo es #{data[:dns]}")
    end
  end
end

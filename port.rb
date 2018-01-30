#!/usr/bin/ruby

require 'socket'
require 'timeout'
require 'twilio-ruby'

@client = Twilio::REST::Client.new "your_twilio_sid", "your_twilio_token"

def port_open?(ip, port)
begin
   Timeout.timeout(5) do
      begin
         TCPSocket.new(ip, port)
      rescue Errno::ENETUNREACH
         retry
      end
   end
rescue
    @client.api.account.calls.create(
    from: "your_twilio_number",
    to: "your_target_number",
    url: "http://twimlets.com/message?Message%5B0%5D=The%20%2Cport%2C#{port}%2C%2Cis%20down%20on%20host%20#{ip}.&"
  )
end
end

if port_open?("your_ip_address_to_montitor", 143)
 puts "Port 143 is open and listening"
end

if port_open?("your_ip_address_to_montitor", 443)
  puts "Port 443 is open and listening"
end

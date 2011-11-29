$:.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'squeezebox'

s=Squeezebox.new({:host => '192.168.0.168'})

puts s.status
puts s.version('?')
#puts s.play
#puts s.stop
#puts s.exit
puts s.player('count ?')
puts s.power('?')
puts s.power('1')
puts s.power('?')


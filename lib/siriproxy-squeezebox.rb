require 'cora'
require 'siri_objects'
require 'squeezebox'

#######
# This is a "hello world" style plugin. It simply intercepts the phrase "text siri proxy" and responds
# with a message about the proxy being up and running (along with a couple other core features). This 
# is good base code for other plugins.
# 
# Remember to add other plugins to the "config.yml" file if you create them!
######

class SiriProxy::Plugin::Squeezebox < SiriProxy::Plugin
  def initialize(config)
    puts 'enter initialize'
    @s = Squeezebox.new(config)
    puts 'leave initialize'
  end

  listen_for /radio on/i do
    @s.power('1')
    say "Radio is now turned on!"
    request_completed
  end
  
end


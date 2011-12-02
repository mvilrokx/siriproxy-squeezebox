require 'cora'
require 'siri_objects'
require 'squeezeboxer'

#######
# This is a "hello world" style plugin. It simply intercepts the phrase "text siri proxy" and responds
# with a message about the proxy being up and running (along with a couple other core features). This 
# is good base code for other plugins.
# 
# Remember to add other plugins to the "config.yml" file if you create them!
######

class SiriProxy::Plugin::Squeezebox < SiriProxy::Plugin
  def initialize(config)
    @s = Squeezeboxer.new(config)
  end

  listen_for /radio on/i do
    @s.power('1')
    say "Radio is now turned on!"
    request_completed
  end
  
  listen_for /radio of/i do
    @s.power('0')
    say "Radio is now turned off!"
    request_completed
  end
  
  listen_for /artist (.+)/i do |artist_name|
    @s.playlist("loadtracks contributor.namesearch=#{artist_name}")
    say "Playing songs by #{artist_name}"
    request_completed
  end
  

end


$:.unshift(File.join(File.dirname(__FILE__), 'lib'))

%w(uri net/telnet).each{|lib| require lib}

class Squeezebox

  def initialize(config = {})
    @t = Net::Telnet::new(
      'Host' => config['host']||'localhost',
      'Port' => config['port']||9090,
      'Prompt' => /./ # needed to work
    )
    @id_set = false
    @id = self.player('id ?')
    @id_set = true
  end

  def method_missing(method,*args)
    args = args * ' '
    regex = [method.to_s,args.to_s].join(' ').sub(/\s\?/,'') + '\s\??\s?'
    regex = @id_set ? ['(' + @id + ' )?',regex].join(): regex
    regex = Regexp.new(regex)
    rs = URI.decode(@t.cmd("#{method} #{args}").strip!)
    rs.sub!(regex,'')
  end

end

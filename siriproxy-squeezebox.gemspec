# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "siriproxy-squeezebox"
  s.version     = "0.0.4" 
  s.authors     = ["mvilrokx"]
  s.email       = [""]
  s.homepage    = ""
  s.summary     = %q{Siri Proxy Plugin that allows control of a Squeezebox player}
  s.description = %q{This Siri Proxy plugin gives Siri control over a Squeezebox player on the network.  Currently only 1 player is supported }

  s.rubyforge_project = "siriproxy-squeezebox"

  s.files         = `git ls-files 2> /dev/null`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/* 2> /dev/null`.split("\n")
  s.executables   = `git ls-files -- bin/* 2> /dev/null`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end

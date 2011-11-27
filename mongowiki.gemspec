# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mongowiki/version"

Gem::Specification.new do |s|
  s.name        = "mongowiki"
  s.version     = MongoWiki::VERSION
  s.authors     = ["Sascha Wessel"]
  s.email       = ["swessel@gr4yweb.de"]
  s.homepage    = "http://www.gr4yweb.de/gems/mongowiki"
  s.summary     = %q{mongowiki is an sinatra-based rack-application which saves all data to an mongodb}
  s.description = %q{mongowiki is based on sinatra rack app with sprockets (and sass), mongoid and erb}

  s.rubyforge_project = "mongowiki"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # development dependencies
  s.add_development_dependency "rack-test", "~> 0.6.1"
  s.add_development_dependency "minitest", "~> 2.8.1"
  s.add_development_dependency "yard", "~> 0.7.3"
  
  # runtime dependencies
  s.add_runtime_dependency "sinatra", "~> 1.3.1"
  s.add_runtime_dependency "mongoid", "~> 2.3.4"
  s.add_runtime_dependency "sinatra-mongoid-config", "~> 0.1.2"
  s.add_runtime_dependency "redcarpet", "~> 1.17.2"
  s.add_runtime_dependency "sprockets", "~> 2.1.2"
  s.add_runtime_dependency "sass", "~> 3.1.10"

end

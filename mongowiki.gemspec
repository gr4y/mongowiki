# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mongowiki/version"

Gem::Specification.new do |s|
  s.name        = "mongowiki"
  s.version     = MongoWiki::VERSION
  s.authors     = ["Sascha Wessel"]
  s.email       = ["swessel@gr4yweb.de"]
  s.homepage    = "http://github.com/gr4y/mongowiki"
  s.summary     = %q{mongowiki is an sinatra-based wiki application, which persists your articles into an mongodb}
  s.description = %q{mongowiki is an sinatra-based wiki application, which persists your articles into an mongodb}
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # development dependencies
  s.add_development_dependency "rake"
  s.add_development_dependency "rack-test"
  s.add_development_dependency "minitest"
  s.add_development_dependency "mongoid-minitest"
  s.add_development_dependency "yard"
  s.add_development_dependency "unicorn"
  s.add_development_dependency "database_cleaner"
  
  # base dependencies
  s.add_runtime_dependency "rack", "~> 1.4.1"
  s.add_runtime_dependency "rack-contrib", "~> 1.1.0"
  s.add_runtime_dependency "rack-cache", "~> 1.1.0"
  s.add_runtime_dependency "sinatra", "~> 1.3.2"
  s.add_runtime_dependency "sinatra-contrib", "~> 1.3.1"
  s.add_runtime_dependency "activesupport", "~> 3.2.0"
  s.add_runtime_dependency "yajl-ruby", "~> 1.1.0"
  
  # database 
  s.add_runtime_dependency "mongoid", "~> 2.4"
  s.add_runtime_dependency "mongoid_search", "~> 0.2.7"
  s.add_runtime_dependency "bson_ext", "~> 1.5"
  
  # frontend / assets
  s.add_runtime_dependency "redcarpet", "~> 2.1.0"
  s.add_runtime_dependency "coderay", "~> 1.0.6"
  s.add_runtime_dependency "sprockets", "~> 2.1.2"
  s.add_runtime_dependency "sprockets-helpers", "~> 0.3.0"
  s.add_runtime_dependency "sass", "~> 3.1.17"
  s.add_runtime_dependency "rabl", "~> 0.6.10"

end

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
  s.add_development_dependency "rake", "~> 0.9.2.2"
  s.add_development_dependency "rack-test", "~> 0.6.1"
  s.add_development_dependency "minitest", "~> 3.3.0"
  s.add_development_dependency "mongoid-minitest", "~> 0.1.2"
  s.add_development_dependency "yard", "~> 0.9.20"
  s.add_development_dependency "unicorn", "~> 4.3.1"
  s.add_development_dependency "database_cleaner", "~> 0.8.0"
  
  # base dependencies
  s.add_runtime_dependency "rack", "~> 1.4.1"
  s.add_runtime_dependency "happy", "~> 0.1.0"
  s.add_runtime_dependency "activesupport", "~> 3.2.0"
  s.add_runtime_dependency "yajl-ruby", "~> 1.1.0"
  
  # database 
  s.add_runtime_dependency "mongoid", "~> 3.0.5"
  s.add_runtime_dependency "bson_ext", "~> 1.6.4"
  s.add_runtime_dependency "mongoid_search", "~> 0.3.0"
  s.add_runtime_dependency "mongoid-simplify", "~> 0.0.1"
  
  # frontend / assets
  s.add_runtime_dependency "redcarpet", "~> 2.1.0"
  s.add_runtime_dependency "coderay", "~> 1.0.6"
  s.add_runtime_dependency "rabl", "~> 0.6.10"
  s.add_runtime_dependency "diffy", "~> 2.0.7"
  s.add_runtime_dependency "packr"
end

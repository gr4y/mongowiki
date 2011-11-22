$:.unshift(File.expand_path(File.join(File.dirname(__FILE__), "lib")))
require 'mongowiki'

map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'assets/javascripts'
  environment.append_path 'assets/stylesheets'
  run environment
end
map '/' do
  run MongoWiki::Application
end

$:.unshift(File.expand_path(File.join(File.dirname(__FILE__), "lib")))
require 'mongowiki'
require 'sprockets'

map '/assets' do
  environment = ::Sprockets::Environment.new
  environment.append_path 'assets/javascripts'
  environment.append_path 'assets/stylesheets'
  environment.logger = Logger.new(STDOUT)
  run environment
end

map '/' do
  run MongoWiki::Application.new
end

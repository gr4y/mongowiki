require 'minitest/autorun'
require 'rack/test'
require 'mongowiki'
require 'yaml'

if !ENV['TRAVIS']
  yaml = YAML::load_file('test/mongodb.yml')
  ENV['MONGO_URL']=yaml['url']
end
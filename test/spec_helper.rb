require 'minitest/autorun'
require 'rack/test'
require 'database_cleaner'
require 'mongoid-minitest'
require 'mongowiki'
require 'yaml'

# if the suite is not running on travis, 
# read the url to mongodb from test/mongodb.yml 
if !ENV['TRAVIS']
  yaml = YAML::load_file('test/mongodb.yml')
  url=yaml['url']
  Mongoid::Config.from_hash("uri" => url)
end

# setup DatabaseCleaner
DatabaseCleaner.strategy = :truncation

class MiniTest::Spec
  include Mongoid::Matchers
  include Rack::Test::Methods
  
  before :each do
    DatabaseCleaner.start
  end

  after :each do
    DatabaseCleaner.clean
  end
  
end
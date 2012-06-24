require 'minitest/autorun'
require 'rack/test'
require 'database_cleaner'
require 'mongoid-minitest'
require 'mongowiki'
require 'yaml'

# if the MONGO_URL enviroment variable is not set, 
# read the url from test/mongodb.yml
if !ENV['MONGO_URL']
  if !::File.exists?('test/mongodb.yml') 
    raise "MONGO_URL environment variable not set and test/mongodb.yml not found"
  end
  yaml = YAML::load_file('test/mongodb.yml')
  Mongoid::Config.from_hash("uri" => yaml['url'])
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
require 'minitest/autorun'
require 'rack/test'
require 'database_cleaner'
require 'mongoid-minitest'
require 'mongowiki'
require 'yaml'

ENV['MONGO_URL']='mongodb://localhost/mongowiki_test'

def mongo_url 
  url = ENV['MONGO_URL']
  if !url
    if !::File.exists?('test/mongodb.yml')
      raise 'MONGO_URL environment variable not set and test/mongodb.yml not found'
    end
    yaml = YAML::load_file('test/mongodb.yml')
    url = yaml['url']
  end  
  url
end

# set mongo_url 
Mongoid::Config.from_hash("uri" => mongo_url)

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
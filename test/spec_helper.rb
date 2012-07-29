require 'minitest/autorun'
require 'mongoid-minitest'
require 'database_cleaner'
require 'rack/test'
require 'yaml'

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
ENV['MONGO_URL'] = mongo_url

require 'mongowiki'
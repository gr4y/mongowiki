require 'sinatra'
require 'mongoid'

module MongoWiki
  class Database < Sinatra::Base
    # configure the mongoid database
    configure do
      @config = YAML.load_file('config.yml')  
      ::Mongoid.configure do |config|
        config.master = Mongo::Connection.new(@config['host']).db(@config['database'])
      end      
    end
  end
end
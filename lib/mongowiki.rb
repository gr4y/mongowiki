require 'mongoid'
require 'mongoid_search'

require 'erb'
require 'rabl'
require 'sass'

require 'redcarpet'
require 'coderay'
require 'diffy'
require 'happy'

require 'mongowiki/models'
require 'mongowiki/helpers'
require 'mongowiki/controllers'

Mongoid.logger.level = 3

module MongoWiki
  
  # 
  # the application
  #
  # usage:
  # 
  #   MongoWiki.run!
  class << self
    
    attr_reader :mongo_uri
    
    # set mongo_uri
    def mongo_uri=(uri)
      Mongoid::Config.from_hash("uri" => uri)
      @@mongo_uri = uri
    end
    
    # init application
    def init!
      if mongo_uri = ENV['MONGO_URL'] 
        self.mongo_uri = mongo_uri 
      else
        raise "environment variable MONGO_URL is not set!"
      end
    end
    
    # run application
    def run! 
      init!
      Article.index_keywords!
      Rack::Cascade.new([SearchController, ArticlesController, AssetsController])
    end
    
  end
  
end
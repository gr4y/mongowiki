require 'sinatra'
require 'mongoid'
require 'mongoid_search'
require 'rack/contrib'
require 'active_support/concern'

require 'erb'
require 'rabl'
require 'sass'
require 'sprockets'
require 'sprockets-helpers'
require 'redcarpet'
require 'coderay'

require 'mongowiki/models/article'
require 'mongowiki/helpers'
require 'mongowiki/articles'
require 'mongowiki/search'
require 'mongowiki/app'

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
      MongoWiki::App.run!
    end
    
  end
  
end
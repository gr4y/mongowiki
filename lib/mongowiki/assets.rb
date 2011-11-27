require 'sprockets'

module MongoWiki
  
  class Assets < Sprockets::Environment
    
    def initialize 
      super
      self.append_path 'assets/javascripts'
      self.append_path 'assets/stylesheets'
      # leaving this here for debugging 
      # self.logger = Logger.new(STDOUT)
    end
    
  end
  
end
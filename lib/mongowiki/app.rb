module MongoWiki
  class App < Sinatra::Base
    
    # set paths
    set :root, File.expand_path(__FILE__)
    set :views, File.expand_path('../../views/', root)
    set :assets_path, File.expand_path('../../assets', root)
    
    # sinatra
    set :show_exceptions, true
    set :logging, false
  
    # sprockets    
    set :sprockets, Sprockets::Environment.new(root)
    set :assets_prefix, '/' 
    # at the moment that's stupid as fuck, but I couldn't come up 
    # with an acceptable solution, so I will stick with it for now
    set :digest_assets, false
    
    configure do
            
      sprockets.append_path File.join(assets_path, "stylesheets")
      sprockets.append_path File.join(assets_path, "javascripts")
      sprockets.append_path File.join(assets_path, "images")
      if logging
        sprockets.logger = Logger.new($stdout)
        Mongoid.logger = Logger.new($stdout)
      end
          
      # Configure Sprockets::Helpers (if necessary)
      Sprockets::Helpers.configure do |config|
        config.environment = sprockets
        config.prefix      = assets_prefix
        config.digest      = digest_assets
      end
      
      Rabl.register!
      
    end

    helpers do 
      include Sprockets::Helpers
      include MongoWiki::Helpers::MessageHelper
      include MongoWiki::Helpers::MarkdownHelper
    end

    include Rack::Utils
    include MongoWiki::Articles
    include MongoWiki::Search
        
    not_found do 
      erb :"404"
    end
    
    def self.run!
      Article.index_keywords!
      Rack::Cascade.new([sprockets, self])
    end
    
  end
end
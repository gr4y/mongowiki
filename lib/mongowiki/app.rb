require 'sass'
require 'erb'

module MongoWiki
  class App < Sinatra::Base
    
    set :views, File.expand_path('../../views/', __FILE__)
    set :sprockets, Sprockets::Environment.new
    set :assets_prefix, '/'
    set :digest_assets, true
    set :show_exceptions, true
    set :logging, true

    configure do
      
      sprockets.append_path File.join(File.expand_path('../../assets', __FILE__), "stylesheets")
      sprockets.append_path File.join(File.expand_path('../../assets', __FILE__), "javascripts")
      sprockets.append_path File.join(File.expand_path('../../assets', __FILE__), "images")
      sprockets.logger = Logger.new(STDOUT)
      
      # Configure Sprockets::Helpers (if necessary)
      Sprockets::Helpers.configure do |config|
        config.environment = sprockets
        config.prefix      = assets_prefix
        config.digest      = digest_assets || false
      end
    end

    helpers Sprockets::Helpers

    include Rack::Utils
    include MongoWiki::Articles

    not_found do 
      erb :"404"
    end

    def self.run!
      Rack::Cascade.new([sprockets, self])
    end
    
  end
end
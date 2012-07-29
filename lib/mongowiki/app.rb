module MongoWiki
  
  class App < Happy::Controller
    
    set :views, File.join(PATH, 'views')
    
    def route
      on('assets') { run AssetsController }
      on('search') { run SearchController }
      run ArticlesController
    end
  
  end
  
end
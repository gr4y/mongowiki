require 'mongowiki/models/article'
require 'haml'
require 'sass'

module MongoWiki
  class Application < Sinatra::Base
    use MongoWiki::Database
    
    set :views, File.join('views')
    set :haml, { :format => :html5 } 
    
    get '/stylesheet.css' do
      sass :stylesheet
    end
  
    get '/' do 
      redirect '/list'
    end
  
    get '/list' do
      if params[:show_deleted]
        conditions = {:deleted => true}
      else
        conditions = {:deleted => false}        
      end
      @articles = Article.all(:conditions => conditions)
      haml :list
    end
    
    get '/show/:id' do 
      @article = Article.find(params[:id])
      haml :show
    end
    
    get '/new' do 
      @article = Article.new
      haml :new_article
    end
    
    post '/create' do       
      if params[:title] && params[:text]
        @article = Article.create(params)
        redirect "/show/#{@article._id}"
      end
    end    

    get '/edit/:id' do 
      @article = Article.find(params[:id])
      haml :edit_article
    end
    
    post '/update/:id' do
      @article = Article.find(params[:id])
      @article.update_attributes(params)
      if @article.save
        redirect "/show/#{@article._id}"
      end
    end
    
    get '/delete/:id' do
      @article = Article.find(params[:id])
      @article.update_attributes(:deleted => true)
      if @article.save
        redirect "/list"
      end
    end
    
    get '/undelete/:id' do
      @article = Article.find(params[:id])
      @article.update_attributes(:deleted => false)
      if @article.save
        redirect "/show/#{@article._id}"
      end
    end
  end
end
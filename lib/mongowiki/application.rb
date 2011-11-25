require 'mongowiki/models/article'
require 'sinatra'
require 'erb'

module MongoWiki
  class Application < Sinatra::Base
        
    configure do 
      config = ::YAML::load_file('config.yml')
      ::Mongoid::configure do |c|
        c.master = ::Mongo::Connection.new(config['host']).db(config['database'])
      end
    end
      
    set :views, File.join('views')
         
    get '/' do 
      redirect '/list'
    end
  
    get '/history' do 
      @articles = Article.all(:conditions => {:deleted => true})
      if @articles.count >= 1
        erb :list
      else 
        @message = "There are no deleted articles yet!"
        erb :error
      end
    end
    
    get '/list' do
      @articles = Article.all(:conditions => {:deleted => false})
      if @articles.count >= 1
        erb :list
      else
        @message = "There are no articles yet!"
        erb :error
      end
    end
    
    get '/show/:id' do 
      begin
        @article = Article.find params[:id]
        erb :show
      rescue Mongoid::Errors::DocumentNotFound => e
        @error = e
        erb :error
      end
    end
    
    get '/new' do 
      @article = Article.new
      erb :new_article
    end
    
    post '/create' do       
      if params[:title] && params[:text]
        @article = Article.create(params)
        redirect "/show/#{@article._id}"
      end
    end    

    get '/edit/:id' do 
      @article = Article.find(params[:id])
      erb :edit_article
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
    
    get '/destroy/:id' do
      @article = Article.find(params[:id])
      if @article.delete
        redirect "/list"
      end
    end
  end
end
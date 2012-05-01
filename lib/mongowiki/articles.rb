module MongoWiki
  module Articles
    extend ActiveSupport::Concern
  
    included do 
          
      get '/' do
        redirect url("/list")
      end   
      
      get '/list' do
        @articles = Article.all
        if @articles.count >= 1
          erb :'article/list'
        else
          @message = "There are no articles yet!"
          erb :error
        end
      end
    
      get '/show/:id' do 
        begin
          @article = Article.find(params[:id])
          erb :'article/show'
        rescue Mongoid::Errors::DocumentNotFound => e
          @error = e
          erb :error
        end
      end
    
      get '/new' do 
        @article = Article.new
        erb :'article/new'
      end
    
      post '/create' do       
        if params[:article]
          @article = Article.create(params[:article])
          redirect url("/show/#{@article._id}")
        end
      end    

      get '/edit/:id' do 
        @article = Article.find(params[:id])
        erb :'article/edit'
      end
    
      post '/update/:id' do
        @article = Article.find(params[:id])
        @article.update_attributes(params[:article])
        if @article.save
          redirect url("/show/#{@article._id}")
        end
      end
          
      get '/destroy/:id' do
        @article = Article.find(params[:id])
        if @article.delete
          redirect url("/list")
        end
      end
      
    end
  end
end
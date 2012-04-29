module MongoWiki
  module Search
    extend ActiveSupport::Concern
    
    included do 

      get '/search' do
        search!
        erb :'search/articles'
      end

      get '/search.:format' do
        format = params[:format]
        unless ['json','xml'].include?(format)
          raise "wrong format #{format}"
        else 
          search!
          render :rabl, :'search/articles', :format => params[:format]
        end
      end
  
      def search!
        query = params[:query]
        puts "search query: #{query}"
        @articles = Article.search(query)
        puts "response: " + @articles.inspect
        @articles
      end
    
    end
  end
end
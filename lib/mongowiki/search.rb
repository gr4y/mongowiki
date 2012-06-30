module MongoWiki
  
  # ActiveSupport::Concern which does all the search functionality
  module Search
    extend ActiveSupport::Concern
    
    included do 

      post '/search' do
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
      
      # search article
      def search!
        query = params[:query]
        @articles = Article.search(query)
        @articles
      end
    
    end
    
  end

end
class SearchController < Happy::Controller
  
  def route
    layout false
    on('search.json') { search(params[:query]) }
  end
  
  def search(query)
    @articles = Article.search(query)
    render 'search/articles.rabl', :format => 'json'
  end
  
end
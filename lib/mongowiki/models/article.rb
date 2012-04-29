class Article
  
  include Mongoid::Document
  include Mongoid::Search
  
  field :title, :type => String
  field :text

  search_in :title, :text

end
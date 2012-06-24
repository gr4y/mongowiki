# mongoid document
class Article
  
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Search
  
  field :title, :type => String
  field :text

  search_in :title, :text

  validates_presence_of :title
  validates_uniqueness_of :title
  validates_presence_of :text

end
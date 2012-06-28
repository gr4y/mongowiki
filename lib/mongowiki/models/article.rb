# mongoid document
class Article
  
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Versioning
  include Mongoid::Search
  
  # document
  field :title, :type => String
  field :text

  # search
  search_in :title, :text

  # validations
  validates_presence_of :title
  validates_uniqueness_of :title
  validates_presence_of :text

end
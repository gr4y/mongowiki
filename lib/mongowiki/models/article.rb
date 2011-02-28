require 'mongoid'

class Article
  include Mongoid::Document
  
  field :title, :type => String
  field :text
  field :deleted, :type => Boolean

end
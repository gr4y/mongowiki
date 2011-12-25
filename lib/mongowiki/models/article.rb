require 'mongoid'

class Article
  include Mongoid::Document
  
  field :title, :type => String
  field :text
  field :deleted, :type => Boolean

  scope :deleted, where(deleted: true).order_by(:title, :desc)
  scope :list, where(deleted: false).order_by(:title, :desc)

end
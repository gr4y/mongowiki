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
  
  # returns an Diffy::Diff object of the given field 
  def diff(aVersion, field)
    version = get_version(aVersion)
    if !version.nil? 
      Diffy::Diff.new(version[field], self[field], :include_plus_and_minus_in_html => true)
    else 
      nil
    end
  end
  
  private 
  def get_version(aVersion)
    version = nil
    versions.each do |v|
      if v.version.eql?(aVersion)
        version = v 
        break
      end
    end
    version
  end
  
end
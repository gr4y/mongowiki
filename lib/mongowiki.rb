require 'happy'
require 'mongoid'
require 'mongoid_search'
require 'redcarpet'
require 'coderay'
require 'diffy'
require 'erb'
require 'rabl'
require 'packr'

PATH = File.join(File.dirname(__FILE__), "mongowiki")

# require the models
Dir[File.join(PATH, *%w[models ** *.rb])].each do |name|
  require name
end

# require initializers first
Dir[File.join(PATH, *%w[initializers ** *.rb])].each do |name| 
  require name
end

Dir[File.join(PATH, *%w[helpers ** *.rb])].each do |name| 
  require name 
end

Dir[File.join(PATH, *%w[controllers ** *.rb])].each do |name| 
  require name 
end

require 'mongowiki/app'
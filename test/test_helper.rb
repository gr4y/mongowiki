require 'minitest/autorun'
require 'rack/test'
require 'mongowiki'

if !ENV['MONGO_URL']
  ENV['MONGO_URL']="mongodb://ATLANTIS/mongowiki_test"
end 
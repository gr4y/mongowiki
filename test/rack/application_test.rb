require 'test_helper'

class ApplicationTest < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def app
    MongoWiki::run!
  end

  def testStylesheet
    get '/application.css'
    assert last_response.ok?
    last_response.headers['Content-Type'].must_equal "text/css"
  end
  
  def testJavascript
    get '/application.js'
    assert last_response.ok?
    last_response.headers['Content-Type'].must_equal "application/javascript"
  end
    
end
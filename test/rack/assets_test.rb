require 'test_helper'

class AssetsTest < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def app
    MongoWiki::Assets.new
  end

  def testApplicationCSS
    get '/application.css'
    assert last_response.ok?     
    get '/application.css'
    assert last_response.ok?
  end

  def testApplicationJS
    # first request
    get '/application.js'
    assert last_response.ok?
    # request again
    get '/application.js'
    assert last_response.ok?
    assert last_response.status == 200
  end
  
end
require 'test_helper'

class ApplicationTest < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def app
    MongoWiki::Application.new
  end

  def testMuh
    get '/'
    assert last_response.ok?
  end
    
end
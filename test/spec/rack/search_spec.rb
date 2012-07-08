require 'spec_helper'

def app
  SearchController
end

describe SearchController do
  
  before :each do
    Mongoid::Factory.build(Article, { :title => 'Once upon time', 
      :text => [*('A'..'Z')].sample(100).join })
  end
  
  it 'should return a json string' do 
    get '/search.json', :query => 'time'
    refute_nil last_response.body
    refute_equal 'nil', last_response.body
  end

end
require "spec_helper"

describe Article do 
  subject { Article }
  
  # Mongoid::Matchers::Document
  
  it { must be_document }
  it { must be_timestamped }
  it { must be_stored_in(:articles) }
  it { must have_field(:title).of_type(String) }
  it { must have_field(:text) }

  # Mongoid::Matchers::Validations

  it { must validate_presence_of(:title) }
  it { must validate_uniqueness_of(:title) }
  it { must validate_presence_of(:text) }
  
  # check if there's a _keywords field, cause of Mongoid::Search
  it { must have_field(:_keywords) }
  
  # check if there's a locked field
#  it { must have_field(:locked).of_type(Boolean) }
end
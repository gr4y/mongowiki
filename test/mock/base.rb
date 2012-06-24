class MockBase < Sinatra::Base

  # has to be set, so the views could be loaded
  set :root, File.expand_path('../../lib', File.dirname(__FILE__))
    
  # make sinatra to call the error handler
  set :raise_errors, Proc.new { true }

  # disable exceptions
  set :show_exceptions, false

  error do
    "error: #{request.env['sinatra.error'].to_s}"
  end

end
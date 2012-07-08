class AssetsController < Happy::Controller
  
  def route

    on 'favicon.ico', 'images' do
      run Happy::Extras::Static, path: './public'
    end
    
    on 'assets' do
      layout false
      max_age 1.year
      
      on 'application-:timestamp.css'  do
        content_type 'text/css'
        render 'application.css'
      end
      
      on 'application-:timestamp.js' do
        run JavaScriptPacker, :files => ['application.js', 'jquery.autoSearch.js']
      end
    end
  end
  
end
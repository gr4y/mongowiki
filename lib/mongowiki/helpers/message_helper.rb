module MongoWiki
  
  module Helpers
    
    module MessageHelper
            
      def message(type, message)
        if session[:messages].nil?
          session[:messages] = []
        end
        session[:messages] << { :type => type, :text => message }
      end
        
      def messages
        if session[:messages].nil?
          session[:messages] = []
        end
        msgs = session[:messages]
        session[:messages] = []
        puts msgs
        msgs
      end
      
    end
    
  end

end
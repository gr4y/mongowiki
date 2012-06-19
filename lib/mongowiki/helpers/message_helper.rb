module MongoWiki
  
  # :nodoc:
  module Helpers
    
    # helper for messages, like flash in rails
    module MessageHelper
      
      # add an message to the session
      def message(type, message)
        if session[:messages].nil?
          session[:messages] = []
        end
        session[:messages] << { :type => type, :text => message }
      end
      
      # returns an array of all messages
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
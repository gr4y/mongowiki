# custom redcarpet markdown renderer
class MarkdownRenderer < Redcarpet::Render::HTML
  
  # higlight the block of code
  def block_code(code, language)
    CodeRay.highlight(code, language)
  end
  
end

# helpers module
module ArticlesHelper
    
  # render markdown
  def markdown(text)
    markdown = Redcarpet::Markdown.new(MarkdownRenderer, :fenced_code_blocks => true)
    markdown.render(text)
  end
  
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
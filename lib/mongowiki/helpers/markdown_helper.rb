# :nodoc:
module MongoWiki

  # custom redcarpet markdown renderer
  class MarkdownRenderer < Redcarpet::Render::HTML

    # higlight the block of code
    def block_code(code, language)
      CodeRay.highlight(code, language)
    end

  end
  
  # :nodoc:
	module Helpers

	  # markdown helper
		module MarkdownHelper

		  # render markdown
			def markdown(text)
			  markdown = Redcarpet::Markdown.new(MongoWiki::MarkdownRenderer, :fenced_code_blocks => true)
			  markdown.render(text)
			end
			
		end
	
	end
	
end
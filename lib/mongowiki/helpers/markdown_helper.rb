
module MongoWiki

  class MarkdownRenderer < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.highlight(code, language)
    end
  end

	module Helpers
		module MarkdownHelper
			def markdown(text)
			  markdown = Redcarpet::Markdown.new(MongoWiki::MarkdownRenderer, :fenced_code_blocks => true)
			  markdown.render(text)
			end
		end
	end
end
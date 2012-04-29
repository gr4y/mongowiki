module MongoWiki
	module Helpers
		module MarkdownHelper
			def markdown(text)
        renderer = Redcarpet::Render::HTML.new(:safe_links_only => true)
        markdown = Redcarpet::Markdown.new(renderer, :autolink => true, :space_after_headers => false)
        markdown.render(text)
      end
		end
	end
end
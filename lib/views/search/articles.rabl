collection @articles, :root => "articles", :object_root => false
attributes :id, :title
node(:excerpt) do |article|
	article.text[0..50]
end
node(:url) do |article| 
	url("/show/#{article.id}") 
end

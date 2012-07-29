//= require_tree .
//= require_self

$(function() {
	$('#search input').autoSearch("/search.json", { minLength: 3 });
});
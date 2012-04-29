(function($){
	$.fn.autoSearch = function(url, options) {

		var input = $(this);
		var requestRunning = false;
		var request;
		
		var defaults = { 
			minLength: 1, 
			queryParam: 'query',
		 	noResultsClass: 'no-results', 
			resultListClass: 'result-list', 
			resultItemClass: 'result-item', 
			itemTitleClass: 'item-title',
			itemExcerptClass: 'item-content'
		};
		
		var opts = $.extend(defaults, options);
				
		$(input).keyup(function(event) {
			event.preventDefault();
			var query = $(input).val();

				if(requestRunning) {
				request.abort();
			}
			
			var resultList = $('.' + opts.resultListClass);
			if(resultList.length <= 0) {
				resultList = document.createElement('ul');
				$(resultList).attr('class', opts.resultListClass);
				$(resultList).appendTo(input.parent());
				$(resultList).bind('mouseleave', function() {
					$(resultList).hide();
				});
			} 
			$(resultList).hide();
			
 			if(query.length >= opts.minLength) {
				$(resultList).empty();
				runningRequest = true;
				request = $.getJSON(url + '?' + opts.queryParam + '=' + query, function(data){
					var articles = data.articles
					if( articles.length > 0 ) {
						
						if(input.hasClass(opts.noResultsClass)) {
							$(input).removeClass(opts.noResultsClass);
						}
						
						$.each(articles, function(i, item) {
							
							var listItem = document.createElement("li");
							$(listItem).attr('class', opts.resultItemClass);
							
							var link = document.createElement("a");
							$(link).attr('class', opts.itemTitleClass);
							$(link).attr('href', item.url);
							$(link).appendTo(listItem);
							
							var title = document.createElement("h2");
							$(title).text(item.title);
							$(title).appendTo(link);
							
							var content = document.createElement("div");
							$(content).attr('class', opts.itemExcerptClass);
							$(content).text(item.excerpt);
							$(content).appendTo(listItem);
							
							$(listItem).appendTo(resultList);
							
						});						
						$(resultList).show();
						runningRequest = false;
					} else {
						$(resultList).hide();
						$(input).addClass(opts.noResultsClass);
						runningRequest = false;
					}
				});
			}
		});
	};
})(jQuery);
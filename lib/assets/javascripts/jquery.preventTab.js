(function($){
	$.fn.preventTab = function() {
		$(this).keydown(function(e) {
			// when the user presses the tab key
			if(e.keyCode == 9) {
				// preventing default behaviour 
				e.preventDefault();
				// append tab to field value
				this.value += '\t'	
			} 
		});
	}
})(jQuery);
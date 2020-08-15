(function($){
	$.fn.toolTip = function(options) {
		
		//Providing plugin defaults 
		
		var defaults = {
		  	background: '#1e2227',
			color: '#fff',
			opacity: '0.8'
		},
		
		 options = $.extend(defaults, options);
		  
		  // Always return the jQuery object to allow for chainability. 
		  
		 return this.each(function() {
		  	var elem = $(this);
			
			//grab the title attribute
			
		 var title = elem.attr('title');
		 
		//only show the tooltip when the title is not empty	
					
			if(title != '') {
				
				//creating the tooltip div
				
			var tooltip = $('<div id="tooltip" />');
			
			//Remove the title attribute's to avoid the native tooltip from the browser
				elem.attr('title','');
				
				// mouse over
				
				elem.hover(function(e) {
					tooltip.hide().appendTo('body')
					  .html(title)
					  .hide()
					  .css({
					  	'background-color' : options.background,
						'color' : options.color,
						'opacity' : options.opacity,
					 })
					  .fadeIn(500);
				  
				},
				
				// mouse out
				
				 function() {
					tooltip.remove(); //remove the tooltip
				});	
			}
			
			//mouse move the tooltip will follow the cursor
			//get X & Y position of the cursor
			
			elem.mousemove(function(e) {
				tooltip.css({
					top: e.pageY + 10,
					left: e.pageX + 20
			     });
				 
			});
			
		  });
		  
	}
})(jQuery);

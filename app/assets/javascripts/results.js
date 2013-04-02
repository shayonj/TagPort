$(document).ready(new function() {
	// Prepare layout options.
	var options = {
		autoResize: true, // This will auto-update the layout when the browser window is resized.
		container: $('#main'), // Optional, used for some extra CSS styling
		offset: 5, // Optional, the distance between grid items
		itemWidth: 260 // Optional, the width of a grid item
	};

	// Get a reference to your grid items.
	var handler = $('#tiles li');

	// Call the layout function.
	handler.wookmark(options);

	// Update the layout.
	handler.wookmark();
		
	 function loadMore()
	{
	   $("div.load").show();
		{
	        $.ajax({
	        url: "<%searches_path%>",
			method: "post",
			data: {
				// twitter_last_id: $("#tiles").data("twitter-las-id")
				tag : "<%=params[:search]%>",
				twitter_last_id :  "<%= @twitter_results.results.last.id %>",
				instagram_max_tag_id :  "<%= @instagram_results.pagination.next_max_tag_id %>"
			},
	        success: function(html)
	        {
	            if(html)
	            {	    

							$("div.load").hide();
	            }else
	            {
	                // $('div#loadmoreajaxloader').html('<center>No more posts to show.</center>');
	            }
	        }
	        });
	    }
	 }

	 function bindScroll(){
	   if($(window).scrollTop() + $(window).height() > $(document).height() - 500) {
	       $(window).unbind('scroll');
	       loadMore();
	   }
	}
	$(window).scroll(bindScroll);	
});
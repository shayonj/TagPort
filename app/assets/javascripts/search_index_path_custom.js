/**
* Custom JS methods for -
*
* Checking white spaces in the search form field and showing message using twitter boostrap popver features
* Showing custom loading option when a search is made
*/

// Checking for white spaces start here
$.validator.addMethod(
        "regex",
        function(value, element) {
		        return this.optional(element) || !/(\s)/.test(value);
		    });

 $('#validateForm').validate({
     rules: {
         search: {
             regex: true
         }
     },

     messages: {
         search: {
             regex: "No spaces please.",
         },
     }, 

     showErrors: function (errorMap, errorList) {

         $.each(this.successList, function (index, value) {
             $('#'+value.id+'').popover('destroy');
         });


         $.each(errorList, function (index, value) {

             $('#'+value.element.id+'').attr('data-content',value.message).popover({
                 placement: 'top',
                 trigger: 'manual',
				 delay: { show: 500, hide: 5000 }
             }).popover('show');

         });

     }

 });
// Checking for white spaces end here

// Showing custom loading option when a search is made starts here
$("div.load").hide();

$("#submitLoad").click(function(){
	$('div.results').empty();
	$("div.load").show();
});

setTimeout(function() {
	$("div.load").hide();
	}, 3000);

// Showing custom loading option when a search is made end here


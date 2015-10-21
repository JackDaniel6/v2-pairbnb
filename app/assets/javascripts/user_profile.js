$(document).ready(function(){
	$('.nav-tabs li:nth-child(1)').hover(
		function(){ 
			$(this).addClass("active"); 
			$('.nav-tabs li:nth-child(2)').removeClass("active");
		});

	$('.nav-tabs li:nth-child(2)').hover(
		function(){ 
			$(this).addClass("active"); 
			$('.nav-tabs li:nth-child(1)').removeClass("active");
		});

	// initial load for user-profile, only loads is class user-profile exists
	if( $('.user-profile').length > 0 ){
	  	$.ajax({
		    url: window.location.href + "/listings",
		    method: "GET",
		    success: function(response){
		    	$html = $.parseHTML( response )
		    	$('.profile-content').html($html)
		    }
		});
	};


	$('#mylistings').on('click hover', function () {
		var link      = window.location.href + "/listings";
      	$.ajax({
		    url: link,
		    method: "GET",
		    success: function(response){
		    	$html = $.parseHTML( response )
		    	$('.profile-content').html($html)
		    }
		});
		return false;
	});

	$('#myreservations').on('click hover', function () {
		var link      = window.location.href + "/reservations";
      	$.ajax({
		    url: link,
		    method: "GET",
		    success: function(response){
		    	console.log(response)
		    	$html = $.parseHTML( response )
		    	console.log($html)
		    	$('.profile-content').html($html)
		    }
		});
		return false;
	});
});
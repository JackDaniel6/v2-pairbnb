$(document).ready(function(){
	$('#date-field').multiDatesPicker({
		minDate: 0,
		maxDate: 120
	});

	function pad(n){return n<10 ? '0'+n : n}

	var availableDates =  $('.dates').data('dates')
	console.log(availableDates)

	function available(date) {
	  dmy = pad(date.getMonth()+1) + "-" + pad(date.getDate()) + "-" + date.getFullYear();
	  console.log(dmy+' : '+($.inArray(dmy, availableDates)));
	  if ($.inArray(dmy, availableDates) != -1) {
	    return [true, "","Available"];
	  } else {
	    return [false,"","unAvailable"];
	  }
	}

	$( "#start-date-picker" ).datepicker({
		dateFormat: "mm-dd-yy",
		beforeShowDay: available,
		onSelect: function(date) {
            alert(date);
            $("#end-date-picker").datepicker('option', 'minDate', new Date(date));
        }
	});

	$( "#end-date-picker" ).datepicker({
		dateFormat: "mm-dd-yy",
		beforeShowDay: available
	});
});
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

	function findMaxDate(minDate) {
		var i = availableDates.indexOf(minDate)
		var date = new Date(availableDates[i])
		dmy = pad(date.getMonth()+1) + "-" + pad(date.getDate()) + "-" + date.getFullYear();
		do {
		    date.setDate(date.getDate() + 1);
	  		dmy = pad(date.getMonth()+1) + "-" + pad(date.getDate()) + "-" + date.getFullYear();
		}
		while ($.inArray(dmy, availableDates) != -1);
		return dmy
	}

	$( "#start-date-picker" ).datepicker({
		dateFormat: "mm-dd-yy",
		beforeShowDay: available,
		onSelect: function(date) {
            $("#end-date-picker").datepicker('option', 'minDate', new Date(date));
            $("#end-date-picker").datepicker('option', 'maxDate', new Date(findMaxDate(date)));
        }
	});

	$( "#end-date-picker" ).datepicker({
		dateFormat: "mm-dd-yy",
		beforeShowDay: available
	});
});
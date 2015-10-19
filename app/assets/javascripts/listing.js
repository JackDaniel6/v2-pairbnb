$(document).ready(function(){
	$('#date-field').multiDatesPicker({
		minDate: 0,
		maxDate: 60
	});

	console.log($('.dates').data('dates'))
	$( "#start-date-picker" ).datepicker({
		dateFormat: "yy-mm-dd",
	});

	$( "#end-date-picker" ).datepicker({
		dateFormat: "yy-mm-dd",
	});
});
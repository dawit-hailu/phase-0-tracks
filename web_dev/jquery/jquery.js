console.log('script running');
$(function() {
	var operator = "";
	var display = "";
	var rslt = "";
	$('.number').on('click', function() {
		display += $(this).attr('value');
        $('#result').val(display);
	} );

	$('.operator').on('click', function() {
		rslt = eval(rslt + operator + display);
		display = "";
		operator = $(this).attr('value');
		$('#result').val(rslt);
	});

	$('#clear').on('click', function(){
		$(this).css('border', 'none');
		$('#result').val('0');
		operator = "";
		display = "";
		rslt = "";
	});

	$('.number, .operator').hover( function() {
		$(this).css('background-color', '#ff0')
		}, function() {
        $(this).css('background-color', '')
	});
	
	// function calc(){
	// 	var equation = document.getElementById("result").value;
	// 	document.getElementById("result").value = eval(equation);
	// }

});
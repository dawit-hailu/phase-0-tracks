console.log(eval("2+3"));
function update_display(val){
	document.getElementById("result").value += val;
}
function calc(){
	var equation = document.getElementById("result").value;
	document.getElementById("result").value = eval(equation);
}
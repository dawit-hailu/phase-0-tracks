//Pseudocode

/*-create a function that takes an input string
   inside the function
  -find out number of charcters
  -iterate through all characters
  -append each character to a new variable
  -return new variable*/
function reversString(str) {
	var newString = "";
	var stringLength = str.length;
	for (i=stringLength; i > -1; i--) {
	newString += str.charAt(i);
	}
	return newString;
}  
console.log(reversString("Hello"));
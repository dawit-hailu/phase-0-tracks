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
function checkPalindrom(str) {
	if (str == reversString(str)) {
		console.log(str + " is a Palindrome!!");
	}
	else {
		console.log(str + " is not a Palindrome.");
	}
}
var myString = "hello"
var palString = "madam"
console.log("When you reverse " + myString + " you get " + reversString(myString));
checkPalindrom(myString);
console.log("When you reverse " + palString + "  you get " + reversString(palString));
checkPalindrom(palString);
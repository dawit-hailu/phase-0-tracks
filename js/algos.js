function largest(phrase){
  highestCount = 0;
  highesIndex = 0;
  for(var i = 0; i < phrase.length; i++) {
    count = phrase[i].length;
    if (count > highestCount){
      highestCount = count;
      highestIndex = i;
    }
  }
  return phrase[highestIndex];
}

function shareValue(obj1, obj2){
  for (var key in obj1) {
    if (obj1.hasOwnProperty(key) && obj2.hasOwnProperty(key) ) {
       if (obj1[key] == obj2[key]){
      	  return true;
      }
    }
  }
}

//this function returns a random integer b/n 0 and 9

function randInt() {
  //get a random number b/n 0 and 1
  //multiply by 10 to get a random float b/n 0 and 9
  num  = Math.random()*10;
  counter = 0
  while(num > 1) {
    counter += 1;
    num -= 1;
  }
  return counter;
}
// spit takes integer and returns an array with [int] words

function spit(numberOfWords) {
  var words = []
  for (var i = numberOfWords; i > 0; i--) {
    randomString = Math.random().toString(36).replace(/[^a-z]/g, '');
    words.push(randomString.substring(0, randInt()+1));
  }
  return words;
}

// Driver code below

for (var i = 0 ; i < 10; i++) {
  //get random number array of words 
  words = spit(randInt()+2);
  //print words
  console.log("Array of words: " + words);
  //print largers word
  console.log("Largest word: " + largest(words) + "\n");

}
// console.log(largest(["long phrase","longest phrase","longer phrase"]));
// console.log(shareValue({name: "Steven", age: 54}, {name: "Tamir", age: 54}));
// console.log(spit(3));
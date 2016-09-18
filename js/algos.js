function whichIs(phrase){
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

console.log(whichIs(["long phrase","longest phrase","longer phrase"]))
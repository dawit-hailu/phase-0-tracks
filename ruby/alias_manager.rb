def next_vowel (ch)
   ch.downcase!
   vowels='aeiou'
   ch == 'u' ?
   'a': vowels[vowels.index(ch)+1]
end
next_vowel 'a'
def next_consonant (ch)
   ch.downcase!
   consonants='bcdfghjklmnpqrstvwxyz'
   ch == 'z' ?
   'b': consonants[consonants.index(ch)+1]
end
next_consonant 'z'
def swap (string)
    string=string.split " "
	temp=string[0]
	string[0]=string[1]
	string[1]=temp
	string.join " "
end
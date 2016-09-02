def next_vowel (ch)
   ch.downcase!
   vowels='aeiou'
   ch == 'u' ?
   'a': vowels[vowels.index(ch)+1]
end

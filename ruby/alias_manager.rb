#a method to switch between vowel
def next_vowel (ch)
   ch.downcase!
   vowels='aeiou  '
   ch == 'u' ?
   'a': vowels[(vowels.index(ch))+1]
end
next_vowel 'a'

#a method to switch consonants
def next_consonant (ch)
   ch.downcase!
   consonants='bcdfghjklmnpqrstvwxyz  '
   ch == 'z' ?
   'b': consonants[consonants.index(ch)+1]
end
next_consonant 'z'

#a method to swap first and last name
def swap (string)
    string=string.split " "
  temp=string[0]
  string[0]=string[1]
  string[1]=temp
  string.join " "
end

#a method to check character and return true if vowel
def vowel? (ch)
  ch.downcase!
  if ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u'
    true
    else
    false
    end
end

alias_hash={}

choice=""
until choice == 'quit' do
    puts "Enter first and last name:"

    #get user input
    full_name=gets.chomp

    #swap first and last name
    new_alias=swap full_name

    #split alias into characters
    new_alias = new_alias.split ''

    #map each letter either to the next cosonant or next vowel dependeng on each letter
    new_alias.map! { |letter| (vowel? letter) ?
     (next_vowel letter) : (next_consonant letter) }

    #join new alias into a string
    new_alias=new_alias.join ''

    #split string into words i.e first name and last name
    new_alias=new_alias.split (' ')

    #Capitalize each word and join them into a string
    new_alias = new_alias.map{|word| word.capitalize}.join(' ')

    #Add allias to hash
    alias_hash[full_name.to_sym]=new_alias

    puts "Your new alias is : #{new_alias}"
    puts "\nType 'quit' to quit or press ENTER to continue...."
    choice=gets.chomp
end

alias_hash.each{ |k,v| puts "#{k} AKA #{v}"}
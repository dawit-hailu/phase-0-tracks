# -Ecrypt method
# -user input
# -start a loop for the length of the string
# 	-check if the current letter is " "
# 	   if it is do nothing
# 	if it is not a blank space
# 		change letter to next (i.e a change it "a".next)
#     end loop
# return the string

def encrypt()
	puts "Einter a string:"
	str=gets.chomp
   (str.length).times do |i|
   	 if not str[i] == " "
       str[i]=str[i].next
     end
   	end
   return str
end
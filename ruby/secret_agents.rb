# -Ecrypt method
# -user input
# -start a loop for the length of the string
# 	-check if the current letter is " "
# 	   if it is do nothing
# 	if it is not a blank space
# 		change letter to next (i.e a change it "a".next)
#     end loop
# return the string

# Decrypt method
# -user input
# -start a loop for the length of the string
#     -check if current letter is " "
#          if it is do nothing
#     if it is not
#     	 alphabet="abcdefghijklmnopqrstuvwxyz"
#     	 str="hallo"
#     	 str[i=0] = 'h'  two steps
#     	    -find index of h in the alphabet
#     	    -find a lettr with index -1
#     	    put letter on str[i]
#     end loop 
#     return str

# -prompt user input?

         
def encrypt(str)
   (str.length).times do |i|
   	 if not str[i] == " "
       str[i] == "z" ? str[i] = "a" : str[i] = str[i].next
     end
   	end
   return str
end
# encrypt()

def decrypt(str)
	alphabet="abcdefghijklmnopqrstuvwxyz"
	(str.length).times do |i|
		if not str[i] == " "
			str[i]= alphabet[(alphabet.index(str[i]))-1]
		end
	end
	str
end

def prompt()
	puts "\e[H\e[2J"
	puts "1.Encrypt"
	puts "2.Dcrypt"
	puts "3.Exit"
	puts "Please enter your choice: "
    choice=gets.chomp.to_i
    if choice > 3 || choice < 1 then
      puts "Invalid input.Press enter/return to continue......"
      gets
      prompt()
    elsif choice == 1
      puts "Enter a password: "
      pwd=gets.chomp
      puts "\nEncrypted password: #{encrypt pwd}\n"
      puts "Press enter/return to continue........"
      gets
      prompt()
    elsif choice == 2
      puts "Enter encrypted password: "
      pwd=gets.chomp
      puts "\nDecrypted password: #{decrypt pwd}\n"
      puts "Press enter/return to continue........"
      gets
      prompt()
    else
      puts "Thank you! safe encrption ....."
  end
end

prompt()

# decrypt(encrypt("swordfish"))
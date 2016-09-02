# 1-declare a hash whit the following atributes
# Empty strings Strings
# 	-name
# 	-address
# 	-email
# 	-phone
# 	-fave shade of blue
# boolean set to false 
# -wallpaper preferences
# --take an input from the user and chage to string for first part
# -ask the user yes or no questions for the boolean part
# -print hash
applicant_info = {
	name: "",
	age: "",
	num_of_chil:0,
	decore_theme: [],
	fav_color: "",
	passed: false
}

puts "Applicant Name:"
applicant_info[:name]=gets.chomp
puts "Enter age:"
applicant_info[:age]=gets.chomp.to_i
puts "Number of children:"
applicant_info[:num_of_chil]=gets.chomp.to_i
puts "Enter your favorite color:"
applicant_info[:fav_color]=gets.chomp
puts "Ether decore theme that applies to you \n type 'done' when done!\n 
1.Paisley
2.Chevrons
3.Photorealistic woodsy scenes (with or without squirrels)
4.Abstract woodsy scenes (no squirrels)"
decore=['Paisley','Chevrons','Photorealistic woodsy scenes (with or without squirrels)','Abstract woodsy scenes (no squirrels)']
choice=gets.chomp.to_i
until choice.to_s == "done" || choice > 4 || choice < 1
   applicant_info[:decore_theme].push(decore[choice-1])
   choice=gets.chomp.to_i
end

puts applicant_info

puts "Do you want to update an entry?\n type 'none' to skip otherwise enter key"
choice = gets.chomp

unless choice == 'none'
   puts "Enter new value:"
   value=gets.chomp
   if choice.to_sym == :decore_theme
   	 applicant_info[:decore_theme].push(value)
   
   elsif choice == 'name'|| choice == 'fav_color' 
     applicant_info[choice.to_sym]=value
   
   elsif choice == 'age' || choice == 'num_of_chil'
     applicant_info[choice.to_sym]=value.to_i
   else
     puts "Key not found!"	
   
   end
     
   puts "Applicant Info"
   applicant_info
end   

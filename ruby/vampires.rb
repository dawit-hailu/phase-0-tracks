def tellavampire()
	puts "What is your name: "
	name = gets.chomp
	puts "How old are you?"
	age = gets.chomp.to_i
	puts "What year were you born?"
	year = gets.chomp.to_i
	age_is_right = (2016-year == age)
	puts "our company cafeteria serves bread. Should we order some for you?"
	garlic=gets.chomp
	likes_garlic=(garlic=="yes")
	puts "Would you like to enroll in the company's health insurance?"
	insurance=gets.chomp
	opts_insurance = (insurance=="yes")
	result=""

	if name == "Drake Cula" || name == "Tu Fang"
		result = "Definitely a vampire."
	elsif age_is_right && (likes_garlic || opts_insurance)
	    result = "Probably not a vampire."
	elsif !age_is_right && !likes_garlic && !opts_insurance
		result = "Almost certainly a vampire."
	else
		result = "Results inconclusve."
	end
    
    puts "Enter alergies:"
    alergy = ""
    until alergy == "done" || alergy == "sunshine" do
    	alergy=gets.chomp
    end
	alergy == "sunshine" && (result == "Probably not a vampire." || result == "Results inconclusve.") ? result = "Probably a vampire" : result
end
puts "How many employees do you want to check"
n_of_employees=gets.chomp.to_i
n_of_employees.times do |i|
	puts "Enter employee number #{i+1}"
	puts tellavampire()
	gets
end
puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."
gets
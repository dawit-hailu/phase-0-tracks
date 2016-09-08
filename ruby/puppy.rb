# Breed ------------------------
# Canine

# CHARACTERISTICS ----------------
# Name: varies
# Age: varies
# Gender: varies
# Color: varies
# Bark vol: 8


# BEHAVIOR -----------------------
# Aggressive: varies
# Playfull: yes
class Puppy

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end
  def speak(int)
  	int.times do
  		p "Woof!"
  	end
  end
  def roll_over
  	puts "*Rolls over*"
  end
  def dog_years(human_years)
  	human_years * 7
  end
  def sit
	puts "sits down"
  end
end

pup=Puppy.new()
pup.fetch("ball")
pup.speak(2)
pup.roll_over
pup.dog_years(4)
pup.sit
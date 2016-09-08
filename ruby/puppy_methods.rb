class Puppy
  def initialize
	puts "Initializing new puppy instance ..."
  end

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

class Programmer
	def initialize
		puts "Initializing new programmer instance ... "
		@name = ["Pablo", "Dawit", "Johnnie", "Obama", "Osama"]
		@language = ["Ruby", "Jdango", "C++", "Java"]
		@beverage = ["Coffe", "Beer", "Energy drink", "Bourbon"]
		@status = ["stressing!", "Happy", "Confused", "Done", "EMO"]
		
	end
	def drink(int)
		puts "Drinks #{int} Cups of #{@beverage.sample}"
	end
	def code
		puts "Coding some #{@language.sample}"
	end
	def status
		puts "#{@name.sample} is currently #{@status.sample}"
		
	end
end

programmers = []
15.times do 
	programmers << Programmer.new()
end
programmers.each do |programmer|
	puts "________________________________"
	puts programmer.status
	puts programmer.drink(rand(7))
	puts programmer.code
	
end
gets

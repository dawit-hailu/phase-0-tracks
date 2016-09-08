class Santa

	attr_reader :ethnicity
	attr_accessor :gender

	def speak
		p "Ho, ho, ho! Haaaappy holidays!"
	end
	def eat_milk_and_cookies(cookie_type)
		p "That was a good #{cookie_type}!"
	end
	def initialize(gender, ethnicity)
		@gender = gender
		@ethnicity = ethnicity
		@reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
		@age = 0
		p "Initializing Santa instance ..."
	end
	def celebrate_birthday
		@age += 1
	end
	def get_mad_at(reindeer)
        last_reindeer = @reindeer_ranking.last
        reindeer_index = @reindeer_ranking.index(reindeer)
		@reindeer_ranking[@reindeer_ranking.index(@reindeer_ranking.last)] = reindeer
		@reindeer_ranking[reindeer_index] = last_reindeer
		p @reindeer_ranking
	end
end

# #only added two gender types and took out a few ethnicities for the sake of simplicity 
# genders = [ "female", "male"]
# ethnicities = ["black", "Latino", "white", "other"]
# #the statstics array holds number of santas in a given group. for exaple 6 female blacks, 4 female latinos and so on...
# statstics = [6, 4, 9, 3, 2, 7, 13, 8]

# stat = 0
# santas = []
# (genders.length).times do |gender|
# 	(ethnicities.length).times do |ethnicity|
# 		statstics[stat].times do
# 			santas << Santa.new(genders[gender], ethnicities[ethnicity])
#         end
#         stat += 1
#     end
# end

santas = []
example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]

def print_santas(santas)
	puts "\e[H\e[2J"
	puts santas.gender
	puts santas.ethnicity
	puts santas.age
end

99.times do |i|
	santas << Santa.new(example_genders.sample, example_ethnicities.sample)
	rand(140).times do
		santas[i].celebrate_birthday
	end
end

choice=""
until choice == "done"
	puts "Random santa"
	print_santas(santas[ran(99)])
	puts "Press ENTER to continue or 'done' to exit"
	choice = gets.chomp
end

# santas.length
# => 52

# santas[3].get_mad_at("Cupid")
# p santas[3].gender
# p santas[3].ethnicity
# santas[3].gender = "unknown"
# p santas[3].gender
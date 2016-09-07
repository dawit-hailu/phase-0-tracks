class Santa
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
end

#only added two gender types and took out a few ethnicities for the sake of simplicity 
genders = [ "female", "male"]
ethnicities = ["black", "Latino", "white", "other"]
#the statstics array holds number of santas in a given group. for exaple 6 female blacks, 4 female latinos and so on...
statstics = [6, 4, 9, 3, 2, 7, 13, 8]

stat = 0
santas = []
(genders.length).times do |gender|
	(ethnicities.length).times do |ethnicity|
		statstics[stat].times do
			santas << Santa.new(genders[gender], ethnicities[ethnicity])
        end
        stat += 1
    end
end

# santas.length
# => 52
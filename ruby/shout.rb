# module Shout
# 	def self.yell_angrily(words)
#       words + "!!!" + " :("
#     end
    
#     def self.yell_happily(words)
#       words + "!!!" + " :D"
#     end
# end

# p Shout.yell_happily("Ureka!!")
# p Shout.yell_angrily("Darn it!")

module Shout
	def yell(words)
      words + "!!!"
    end
end
class Programmer
	include Shout
end
class Person
	include Shout
end

rubyist = Programmer.new()

puts rubyist.yell("I love Ruby")

donald = Person.new()

puts donald.yell("Get him outta here")
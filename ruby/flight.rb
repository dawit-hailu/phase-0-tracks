module Flight
	def take_off(altitude)
		puts "Taking off and ascending until reaching #{altitude}"
	end
end
class Bird
	include Flight
end
class Plane
	include Flight
end

bird = Bird.new()
plane = Plane.new()

bird.take_off(200)
plane.take_off(3000)
def method_block
	puts "---inside method before the bock-----"
	yield("Dawit", "Pablo")
	puts "---inside method after block----"
end
method_block {|name1, name2| "This is #{name1} and #{name2} fancy smancy work"}

actors=['mat demon','bruce lee', 'leonard nemoy']

actors = {
	name: 'leonard nemoy'
	movie: 'star trek'
}

actors.each do |name| 
	puts name
end


array_actors.map! do |actor|
	actor.capitalize
end

array_actors.each do |actor|
	puts actor
end
new_hash = {}    
hash_actors.map { |key, value| new_hash[key] =value.upcase }
new_hash.each {|k,v| puts new_hash[k]}

hash_actors.each  do |key,val| 
	puts "#{key}  was in #{val}" 
end
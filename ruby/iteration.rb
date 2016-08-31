def method_block
	puts "---inside method before the bock-----"
	yield("Dawit", "Pablo")
	puts "---inside method after block----"
end
method_block {|name1, name2| "This is #{name1} and #{name2} fancy smancy work"}

array_actors=['mat demon','bruce lee', 'leonard nemoy', 'Ryan reynolds', 'Christian bale']
array_actors.each do |name| 
	puts name
end

# ______________map array____________

array_actors.map! do |actor|
	actor.capitalize
end

array_actors.each do |actor|
	puts actor
end

hash_actors = {
	'leonard nemoy': 'star trek',
	'mat demon': 'the martian',
	'brandon lee': 'the crow',
	'Ryan reynolds': 'Deadpool',
	'Christian bale': 'Batman'
}
# ______________map hash____________

new_hash = {}    
hash_actors.map { |key, value| new_hash[key] =value.upcase }
new_hash.each {|k,v| puts new_hash[k]}

# ______________condition match delete hash____________

puts "\nHash before delete------------------\n\n"
hash_actors.each  do |key,val| 
	puts "#{key}  was in #{val}" 
end
# hash_actors_filtered =
hash_actors.delete_if {|key,val| key == 'leonard nemoy'.to_sym}
puts "\nHash after delete------------------\n\n"
hash_actors.each  do |key,val| 
	puts "#{key}  was in #{val}"
end

# ______________condition not match delete array____________

puts "\nArray before delete---\n\n"

puts array_actors

array_actors.delete_if {|actor| actor == "Mat demon" } 
puts "\nArray after delete---\n\n"
array_actors.each do |actor|
	puts actor
end

# ______________if condition matchs keep hash____________

puts "\nHash before delete------------------\n\n"
puts hash_actors

hash_actors.delete_if {|key,val| key != 'mat demon'.to_sym}
puts "\nHash after delete------------------\n\n"

puts hash_actors

# ______________condition dont match delete array____________

puts "\nArray before delete---\n\n"

puts array_actors

array_actors.delete_if {|actor| actor == "Bruce lee"  } 
puts "\nArray after delete---\n\n"
array_actors.each do |actor|
	puts actor
end

# ______________if condition matchs keep hash____________

puts "\nHash before delete------------------\n\n"
puts hash_actors

hash_actors.keep_if {|key,val| key == 'mat demon'.to_sym ||actor == 'Christian bale'.to_sym || actor == "Ryan reynolds".to_sym}
puts "\nHash after delete------------------\n\n"

puts hash_actors

# ______________condition match keep array____________

puts "\nArray before delete---\n\n"

puts array_actors

array_actors.keep_if {|actor| actor == 'Christian bale' || actor == "Ryan reynolds" } 
puts "\nArray after delete---\n\n"
array_actors.each do |actor|
	puts actor
end

# ----delete from array antil conternt is one

puts "\n _____________before delete array"
puts array_actors
i=array_actors.length
until array_actors.length == 1 
	array_actors.delete(array_actors[i])
	i -= 1
end

puts "\n ____________ after delete array"
puts array_actors
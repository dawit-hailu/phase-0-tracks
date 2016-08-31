def method_block
	puts "---inside method before the bock-----"
	yield("Dawit", "Pablo")
	puts "---inside method after block----"
end
method_block {|name1, name2| "This is #{name1} and #{name2} fancy smancy work"}
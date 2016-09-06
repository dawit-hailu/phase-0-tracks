# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # put the user on a variable
  # create an array variable and split the input into items
  # iterate over the array and put the items in hash
  # set default quantity = 0 
  # print the list to the console [can you use one of your other methods here?]
# output: use print mathod to print hash

def print_list(list)
	list.each do |item, quantity|
		puts "#{item}----------#{quantity}"
	end
end

def create_list(string)
	itm_arr=string.split(" ")
	list=Hash.new()
	itm_arr.each { |item| list[item]=0}
	print_list(list)
    return list
end

my_list=create_list("apple orange banana")


# Method to add an item to a list
# input: item name and optional quantity
# steps: get input form user
# output: updated list
def add_item(list, item, qt=0)
	list[item]=qt
	list
end
 add_item(my_list, "newitem", 9)

# Method to remove an item from the list
# input: list and key (item name)
# steps: 
# use hash.delete to delete item from the list
# output: updated list

def delete_list(list, item)
	list.delete(item)
	list
end

 delete_list(my_list, "orange")

# Method to update the quantity of an item
# input: list item key and new quantity
# steps: create a method that takes input
# updates the value quantity for item
# output: updated list

def update_quantity(list, item, qt)
	list[item]=qt
	list
end

 update_quantity(my_list, "newitem", 20)
	

# Method to print a list and make it look pretty
# input: list
# steps: iterate through list and print items one at a time 
# output: NA 


print_list(my_list)
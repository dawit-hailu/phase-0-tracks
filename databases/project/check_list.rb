#Psuedocode
=begin
give user an option to 
	1-Add checklist

	2-view checklist
	3-exit


=end

require 'sqlite3'

db = SQLite3::Database.new("user.db")

db.results_as_hash = true

create_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS user(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255)
  )
  CREATE TABLE IF NOT EXISTS to_do_list(
  	id 	INTEGER PRIMARY KEY,
  	user_id FOREIGN KEY REFERENCES users(id),
  	name VARCHAR(255),
  	description VARCHAR(4096),
  	start_date DATE,
  	end_date DATE,
  	marked BOOLEAN

  )
SQL

class User
	db = SQLite3::Database.new("user.db")
	attr_accessor :name, :password
	attr_reader :check_lists
	def initialize(user_name)
		@check_lists = []
		@name = user_name
	end

	def add_to_list(item)
		# id = execute("SELECT id FROM users WHERE name = @name").id
		# db.execute("INSERT INTO to_do_list (name,user_id,description,start_date,end_date,marked) VALUES (?,?,?,?,?,?)", [item.name,id, item.description, item.start_date, item.end_date, item.checked])
        @check_lists << item
	end

	def display_all
		@check_lists.each do |list_item|
			puts list_item.name
		end
	end


end

class CheckList
	attr_accessor :name, :checked, :due_date, :date_added, :description
#intialize CheckList class with current date
# attr_reader :date_added
# attr_accessor
	def initialize
		@date_added
		@description
		@due_date
		@name
		@checked = false
	end

	def display
		
		puts "Date added: #{@date_added}"
		puts "Due date: #{@due_date}"
		puts "Description: #{@description}"
		puts "#{@checked ? "Completed!" : "Incomplete"}"
		puts "***************************************"

	end
end
# lists = []
# lists << CheckList.new("11/12/1234","loundary","do loundary","11/13/2016")
# lists << CheckList.new("11/12/1234","loundary","do loundary","11/13/2016")
# lists << CheckList.new("11/12/1234","loundary","do loundary","11/13/2016")
# lists << CheckList.new("11/12/1234","loundary","do loundary","11/13/2016")

# users = User.new()
# lists.each do |task|
# 	users.add_to_list(task)
# end
# users.display()


def create_new_user
	puts "Enter name: "
	name = gets.chomp
	# db = SQLite3::Database.new("user.db")
	# db.execute("INSERT INTO users(name) VALUES (?)", [name])
	user = User.new(name)
	return user
end

def search(objects, name)
	objects.each{ |object| return object if object.name == name.to_s}
	true
end

def get_input(users)
	if users.length > 0
	    choice = gets.chomp
	    if choice == "1"
			puts "please enter your name: "
			name= gets.chomp
			until search(users, name).class == User do
				puts "try again"
				name=gets.chomp
			end
			current_user = search(users, name)
			
		elsif choice == "2"
		    	current_user = create_new_user
		else
		   	puts "Invalid entry press ENTER to continue...."
		   	gets
		   	get_input(users)
		end
	else
		current_user = create_new_user
	end
end

def task_view(user, index)

	if user.check_lists.length != 0
		puts "\e[H\e[2J"
		index == (user.check_lists.length - 1) ? next_index = 0 : next_index = index + 1
		index == 0 ? prev_index = user.check_lists.length-1 : prev_index = index - 1 
		puts user.name
		user.check_lists[index].display
		puts "'M' mark/unmark as done 'N' next 'P' privious 'E' exit or 'menu' for main menu"
		choice = gets.chomp
		
		if choice == 'N' || choice == 'n'
			task_view(user, next_index)
		elsif choice == 'p' || choice == 'P'
			task_view(user, prev_index)
		elsif choice == 'M' || choice == 'm'
			user.check_lists[index].checked = !user.check_lists[index].checked
			task_view(user, index)
		elsif choice == 'menu'
			prompt_user(user)
		elsif choice == 'E' || choice == 'e'
			puts "Good bye for now ...#{user.name}"
		else
			puts "Invalid entry press ENTER to continue"
			gets
			task_view(user, index)
		end
	else
		puts "There are no tasks to view....press enter to continue"
		prompt_user(user)
	end
end

def prompt_user(user)
	puts "\e[H\e[2J"
	puts "Hello, #{user.name}"
	
	puts "what would you like to do:"
	puts "1.Add task"
	puts "2.Search tasks"
	puts "3.Task viewer"
	choice = gets.chomp
	if choice == '1'
		task = CheckList.new
		puts "Task name :"
		task.name = gets.chomp
		puts "Task Discription"
		task.description = gets.chomp
		puts "Enter due date (MM/DD/YYYY)"
		task.due_date = gets.chomp
		user.add_to_list(task)
		prompt_user(user)
	elsif choice == '2'
		puts "Enter task name you want to view"
		name = gets.chomp.to_s
		until search(user.check_lists, name).class == CheckList || name == 'c' do
            puts "couldnt find that task try again or enter 'c' to cancle"
            name = gets.chomp
		end
		name = 'c' ? prompt_user(user) : task_view(user, user.check_lists.index(search(user.check_lists, name)))
	elsif choice == '3'
		task_view(user, 0)
	else
		puts "Invalid entry press ENTER to continue..."
		gets
		prompt_user(user)
	end
end

users = []
users << User.new("abba")
users << User.new("chala")
users << User.new("dawit")
users << User.new("seleshi")

puts "1.Select user"
puts "2.create new user"
puts "Enter choice:"

prompt_user(get_input(users))
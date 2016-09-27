
=begin
this is a project is for a program that helps you keep track of a to-do list
multiple users can use it to create and manage there own to-do-list
a user can 
  -create a new profile
  -select there own profile
  -add a task to their profile
  -mark or unmark a task as completed
  -search for a task by name

 I used to classes one for the user and the other for the tasks
 I used faker to add 10 users and 20 tasks to the data_base. I wanted to use r_spec
 but, I felt like I didn't have enough time.

=end

require 'sqlite3'
require 'date'
require 'faker'

#class User for user profiles
class User
	attr_accessor :name, :user_id
	attr_reader :check_lists
	def initialize(user_name, id)
		@user_id = id
		@check_lists = []
		@name = user_name
	
	end

	def add_task(task, db)
		db.execute("INSERT INTO tasks (user_id, name, description, start_date) VALUES (?, ?, ?, ?)", [@user_id, task.name, task.description, task.date_added])			
		get_task_list(db)
	
	end

	def get_task_list(db)
		@check_lists = []
		task_list = db.execute("SELECT * FROM tasks WHERE user_id = ?", @user_id)
		task_list.each do |task|
			temp = CheckList.new
			temp.task_id = task['id']
			temp.name = task['name']
			temp.date_completed = task['end_date']
			temp.date_added = task['start_date']
			temp.description = task['description']
			temp.checked = task['marked']
			@check_lists << temp
		
		end
	
	end

end

class CheckList
	attr_accessor  :task_id, :name, :checked, :date_completed, :date_added, :description
#intialize CheckList class with current date
# attr_reader :date_added
# attr_accessor
	def initialize
		@task_id
		@date_added
		@description
		@date_completed = nil
		@name
		@checked = false
	
	end

	def mark_unmark(db, date)
		@checked = !@checked
		db.execute("UPDATE tasks SET marked = ? WHERE id = ?", [@checked.to_s, @task_id])
        if @checked
        	@date_completed = date
        else
        	@date_completed = nil
        end
        db.execute("UPDATE tasks SET start_date = ? WHERE id = ?", [@date_completed, @task_id])

    end

	def display
		puts "______________________________________________________________________________"
		puts "Task ID:#{@task_id}"
	    puts ""
	    puts "     Task Name     : #{@name}"
		puts "     Date added    : #{@date_added}"
		puts "     Date Completed: #{@date_completed}"
		puts "     Description   : #{@description}"
		puts "     Task Status   : #{@checked ? "Completed!" : "Incomplete"}"
		puts "______________________________________________________________________________"

	end

end

#get and reformat current date
def todays_date
	mm = DateTime.now().month.to_s
	dd =DateTime.now().day.to_s
	yyyy = DateTime.now().year.to_s
	mm + "/" + dd + "/" + yyyy

end

#create new user
def create_new_user(db)
	puts "Enter name: "
	name = gets.chomp
	empty = Faker::Name.first_name
#create a user with fake name
	db.execute("INSERT INTO users (name) VALUES (?)", [empty])
#get id for fake name
	user = db.execute("SELECT * FROM users WHERE name = ?", [empty])[0]
	user_id = user['id']
#change fake name with real name
	db.execute("UPDATE users SET name = ? WHERE id = ?", [name, user_id])
	puts "#{name} success!!"
	gets
#now you have real name and coresponding id create a new user profile
#this steps prevent us from runing into error if we had two identical names 
#in the table
	user = User.new(name, user_id)
	return user

end

#this method is used to search for both a user name or task name hence objects
def search(objects, name)
	objects.each{ |object| return object if object.name == name}
	true

end

#this method takes user and index of interst on array of tasks
def task_viewer(user, index, db)

	count = user.check_lists.length
	if count != 0
		puts "\e[H\e[2J"
		index == (count - 1) ? next_index = 0 : next_index = index + 1
		index == 0 ? prev_index = count-1 : prev_index = index - 1 
		puts user.name
		puts "#{index + 1} of #{count}"
		user.check_lists[index].display
		puts "'M' mark/unmark 'D' delete 'N' next 'P' privious 'E' exit or 'menu' for main menu"
		choice = gets.chomp
		
		if choice == 'N' || choice == 'n'
			task_viewer(user, next_index, db)
		elsif choice == 'p' || choice == 'P'
			task_viewer(user, prev_index, db)
		elsif choice == 'M' || choice == 'm'
			user.check_lists[index].mark_unmark(db, todays_date)
			task_viewer(user, index, db)
		elsif choice == 'menu'
			prompt_user(user, db)
		elsif choice == 'E' || choice == 'e'
			puts "Good bye for now ...#{user.name}"
		elsif choice == 'D' || choice == 'd'
			puts "are you sure?(y/n):"
			delete = gets.chomp
			if delete == 'y' || delete == 'Y'
				db.execute("DELETE FROM tasks WHERE id = ?", [user.check_lists[index].task_id])
				user.check_lists.delete_at(index)
				task_viewer(user, 0, db)
			else
				task_viewer(user, index, db)
			end
		else
			puts "Invalid entry press ENTER to continue"
			gets
			task_viewer(user, index, db)
		end
	else
		puts user.name
		puts "0 of 0"
		puts "______________________________________________________________________________"
	    puts ""
	    puts "You dont have any tasks, #{puts user.name} :( press ENTER to continue...."
	    puts "______________________________________________________________________________"
	    gets
		prompt_user(user, db)
	end

end

#with the help of the search user this method returns a User class object
def get_user(users, db)
	puts "1.Select user"
    puts "2.create new user"
    puts "Enter choice:"
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
	    	current_user = create_new_user(db)
	else
	   	puts "Invalid entry press ENTER to continue...."
	   	gets
	   	get_user(users, db)
	end

end

#This method is recursive. thus it prompts the user until the user choses to exit
def prompt_user(user, db)
	puts "\e[H\e[2J"
	puts "Hello, #{user.name}"
	
	puts "what would you like to do:"
	puts "1.Add task"
	puts "2.Search tasks by name"
	puts "3.Task viewer"
	puts "4.Exit"
	choice = gets.chomp
	if choice == '1'
		task = CheckList.new
		task.date_added = todays_date
		task.date_completed = "NA"
		puts "Task name :"
		task.name = gets.chomp
		puts "Task Description:"
		task.description = gets.chomp
		user.add_task(task, db)
		prompt_user(user, db)
	elsif choice == '2'
		puts "Enter task name you want to view"
		name = gets.chomp.to_s
		until search(user.check_lists, name).class == CheckList || name == 'c' do
            puts "couldnt find that task try again or enter 'c' to cancle"
            name = gets.chomp
		end
		name = 'c' ? prompt_user(user, db) : task_viewer(user, user.check_lists.index(search(user.check_lists, name)),db)
	elsif choice == '3'
		task_viewer(user, 0, db)
	elsif choice == '4'
		puts "Good bye for now....."

	else
		puts "Invalid entry press ENTER to continue..."
		gets
		prompt_user(user, db)
	end

end

#=================initial setup begins ==========================================

db = SQLite3::Database.new("to_do_list.db")

db.results_as_hash = true

create_user_table = <<-SQL
  CREATE TABLE IF NOT EXISTS users(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255)
  )
 SQL

 create_tasks_table = <<-SQL
  CREATE TABLE IF NOT EXISTS tasks(
  	id 	INTEGER PRIMARY KEY,
  	user_id FOREIGNKEY REFERENCES users(id),
  	name VARCHAR(255),
  	description VARCHAR(4096),
  	start_date DATE,
  	end_date DATE,
  	marked BOOLEAN

  )
SQL

db.execute(create_user_table)
db.execute(create_tasks_table)

=begin
10.times do
	db.execute("INSERT INTO users (name) values (?)", [Faker::Name.name])
end

insert_new_task_cmd = <<-SQL
INSERT INTO tasks (name, user_id, description, start_date, end_date, marked) VALUES
(?, ?, ?, ?, ?, ?)
SQL

20.times do
	db.execute(insert_new_task_cmd, [Faker::Commerce.department, rand(9), Faker::Company.catch_phrase, "11/22/2016", "11/22/2017"])
end
===================== initial Setup ends =============================================
=end

#create array users that we get from the database
users = []
users_hash = db.execute("SELECT * FROM users")
users_hash.each do |hash|
	user = User.new(hash['name'], hash['id'])
	user.get_task_list(db)
	users << user
end
users_list = ""
count = 10
users.each do |user| 
	users_list += (user.name + " | ")
	count -= 1
	break if count == 0
end
puts "First 10 users: "
puts users_list

prompt_user(get_user(users, db), db)
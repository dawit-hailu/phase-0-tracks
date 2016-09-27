
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
	attr_reader :task_list
	def initialize(user_name, id)
		@user_id = id
		@name = user_name
		@task_list = []
			
	end
#this method pushes a new task to the database 
	def add_task(task, db)
		db.execute("INSERT INTO tasks (user_id, name, description, start_date) VALUES (?, ?, ?, ?)", [@user_id, task.name, task.description, task.date_added])			
		get_task_list(db)
	
	end

	def get_task_list(db)
		@task_list = []
		task_list = db.execute("SELECT * FROM tasks WHERE user_id = ?", @user_id)
		task_list.each do |task|
			temp = Task.new
			temp.task_id = task['id']
			temp.name = task['name']
			temp.date_completed = task['end_date']
			temp.date_added = task['start_date']
			temp.description = task['description']
			temp.is_done = task['marked']
			@task_list << temp
		
		end
	
	end

end

class Task
	attr_accessor  :task_id, :name, :is_done, :date_completed, :date_added, :description 

	def initialize
		@task_id
		@date_added
		@description
		@date_completed = nil
		@name
		@is_done = false
	
	end
#this method marks or unmarks a task as completed
	def mark_unmark(db, date)
		@is_done = !@is_done
		db.execute("UPDATE tasks SET marked = ? WHERE id = ?", [@is_done.to_s, @task_id])
        if @is_done
        	@date_completed = date
        else
        	@date_completed = nil
        end
        db.execute("UPDATE tasks SET end_date = ? WHERE id = ?", [@date_completed, @task_id])

    end
#displays task info	
	def display
		puts "______________________________________________________________________________"
		puts "Task ID:#{@task_id}"
	    puts ""
	    puts "     Task Name     : #{@name}"
		puts "     Date added    : #{@date_added}"
		puts "     Date Completed: #{@date_completed}"
		puts "     Description   : #{@description}"
		puts "     Task Status   : #{@is_done ? "Completed!" : "Incomplete"}"
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

#this is a recursive method used to traverse through a users task_array
def task_viewer(user, index, db)

	count = user.task_list.length
	if count != 0
#this line clears the screen for every prompt
		puts "\e[H\e[2J"
#sets next_index to 0 if end of tasks arraay is reached
		index == (count - 1) ? next_index = 0 : next_index = index + 1
#sets prev_index to the start of tasks array if index is 0 
		index == 0 ? prev_index = count-1 : prev_index = index - 1 
		puts user.name
		puts "#{index + 1} of #{count}"
		user.task_list[index].display
		puts "'M' mark/unmark 'D' delete 'N' next 'P' privious 'E' exit or 'menu' for main menu"
		choice = gets.chomp
#this takes an input from the user on what to display next		
		if choice == 'N' || choice == 'n'
			task_viewer(user, next_index, db)
		elsif choice == 'p' || choice == 'P'
			task_viewer(user, prev_index, db)
		elsif choice == 'M' || choice == 'm'
			user.task_list[index].mark_unmark(db, todays_date)
			task_viewer(user, index, db)
		elsif choice == 'menu'
			prompt_user(user, db)
		elsif choice == 'E' || choice == 'e'
			puts "Good bye for now ...#{user.name}"
		elsif choice == 'D' || choice == 'd'
			puts "are you sure?(y/n):"
			delete = gets.chomp
			if delete == 'y' || delete == 'Y'
				db.execute("DELETE FROM tasks WHERE id = ?", [user.task_list[index].task_id])
				user.task_list.delete_at(index)
				task_viewer(user, 0, db)
			else
				task_viewer(user, index, db)
			end
		else
			puts "Invalid entry press ENTER to continue...."
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
	puts "\n1.Select user"
    puts "2.create new user"
    puts "Enter choice:"
    choice = gets.chomp
    if choice == "1"
#get input from the user in order to search users array
		puts "please enter your name: "
		name= gets.chomp
		until search(users, name).class == User do
			puts "try again"
			name=gets.chomp
		end
		current_user = search(users, name)
		
	elsif choice == "2"
#return a newly created user
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
#prompt the user what they want to do to their profile	
	puts "what would you like to do:"
	puts "1.Add task"
	puts "2.Search tasks by name"
	puts "3.Task viewer"
	puts "4.Exit"
	choice = gets.chomp
	if choice == '1'
		task = Task.new
		task.date_added = todays_date
		puts "Task name :"
		task.name = gets.chomp
		puts "Task Description:"
		task.description = gets.chomp
		user.add_task(task, db)
		prompt_user(user, db)
	
	elsif choice == '2'
		puts "Enter task name you want to view"
		name = gets.chomp.to_s
		until search(user.task_list, name).class == Task || name == 'c' do
            puts "couldnt find that task try again or enter 'c' to cancle"
            name = gets.chomp
            tsk = search(user.task_list, name)
            indx = user.task_list.index(tsk) if tsk.class  == Task 
		end
#if the user enters 'c' go back, other-wise search and view task
		name = 'c' ? prompt_user(user, db) : task_viwer(user, indx, db)
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
#create a new user for each hash
	user = User.new(hash['name'], hash['id'])
	#get task list for each user
	user.get_task_list(db)
	#push each user to users array
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
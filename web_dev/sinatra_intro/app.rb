# require gems
require 'sinatra'
require 'sqlite3'
require 'faker'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# write a basic GET route
# add a query parameter
# GET /
get '/' do
  "#{params[:name]} is #{params[:age]} years old."
end

# write a GET route with
# route parameters
get '/about/:person' do
  person = params[:person]
  "#{person} is a programmer, and #{person} is learning Sinatra."
end

get '/:person_1/loves/:person_2' do
  "#{params[:person_1]} loves #{params[:person_2]}"
end

# write a GET route that retrieves
# all student data
get '/students' do
  students = db.execute("SELECT * FROM students")
  response = ""
  students.each do |student|
    response << "ID: #{student['id']}<br>"
    response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
  end
  response
end

get '/contacts' do
  address = ""
  address << Faker::Address.street_name + " street<br>"
  address << Faker::Address.city + "<br>"
  address << Faker::Address.zip
  address
end

get '/great_job' do
  nam = params[:name]
  if nam 
    "Good job, #{nam}!"
  else
    "Good job!"
  end
end

get '/add' do
  result=params[:a].to_i + params[:b].to_i
  result.to_s
end


# write a GET route that retrieves
# a particular student

get '/students/:id' do
  student = db.execute("SELECT * FROM students WHERE id=?", [params[:id]])[0]
  student.to_s
end
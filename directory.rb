@students = [] # an empty array accessible to all methods

def print_menu
  puts "\n1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list of students" #to students.csv or another file inputed by the user
  puts "4. Load the list of students.csv" #to students.csv or another file inputed by the user
  puts "9. Exit" # 9 because we'll be adding more items  
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      puts "Please provide a filename to save to (default = students.csv)"
      filename = STDIN.gets.delete("\n") 
      save_students(filename)
    when "4"
     puts "Please provide a filename to load from (default = students.csv)"
     filename = STDIN.gets.delete("\n") 
     load_students(filename)
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

#let's put all students into an array
def input_students
  #This message will be considered feedback when the user chose option 1 from the menu
  puts "Please enter the name, cohort (month), hobby and height (in cm) for each student" 
  puts "To finish, just hit return twice"
  # user must provide a valid cohort name included in the 'months' array
  months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"] 
  # get the first name, cohort, hobby and height
  puts "Name: "
  name =  STDIN.gets.delete("\n").split(" ").map{|word| word.capitalize}.join (" ")
  puts "Cohort: "
  cohort =  STDIN.gets.delete("\n").capitalize
  # created a method (DRY) to ask user to introduce a valid cohort
  introduce_valid_cohort(months, cohort, name)  
  puts "Hobby: "
  hobby =  STDIN.gets.delete("\n")
  puts "Height: "
  height =  STDIN.gets.delete("\n")
  # while the name is not empty, repeat this code
  while !name.empty? do
    # if the user doesn't provide input for the hobby and height, a default value is used
    if hobby.empty?
      hobby = "Collecting Steve Jobs memorabilia"
    end

    if height.empty?
      height = "13.14"
    end 
      
    # adding the student hash to the array by calling a method
    access_list_of_students(name, cohort, hobby, height)
    if @students.count == 1
      puts "Now we have 1 student"
    else
      puts "Now we have #{@students.count} students"
    end

    # get another name/cohort/hobby/height from the user
    puts "Name: "
    name =  STDIN.gets.delete("\n").split(" ").map{|word| word.capitalize}.join (" ")
    if !name.empty?
      puts "Cohort: "
      cohort =  STDIN.gets.delete("\n").capitalize
      # created a method (DRY) to ask user to introduce a valid cohort
      introduce_valid_cohort(months, cohort, name)
      puts "Hobby: "
      hobby =  STDIN.gets.delete("\n")
      puts "Height: "
      height =  STDIN.gets.delete("\n")
    end
  end

  # return the array of students
  @students
end

def access_list_of_students(name, cohort, hobby, height)
  @students << {name: name, cohort: cohort.to_sym, hobby: hobby, height: height}
end

def introduce_valid_cohort(months, cohort, name)
  while !months.include?(cohort) && !name.empty?
    puts "Please introduce a valid cohort (name of a month): "
    cohort =  STDIN.gets.delete("\n").capitalize
  end
  cohort
end

def show_students
  print_header
  print_students_list
  print_footer
end
	
def print_header
  #This message will be considered feedback when the user chose option 2 from the menu
  puts"" 
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
  puts""
end

def print_students_list
  if @students.count > 0
     @students.group_by{|student| student[:cohort]}.map do |month, students|
       puts""
       puts "#{month}".center(50,"--")
       students.map{|student| puts "#{student[:name]}".center(50)}
     end
  end 
end

def print_footer
  puts "Overall, we have #{@students.count} great student".center(50,"  ") if @students.count == 1 
  puts "We have no students enrolled at the moment".center(50,"  ") if @students.count == 0 
  puts "Overall, we have #{@students.count} great students".center(50,"  ") if @students.count > 1    
end

def save_students(filename)
  # open the file for writing
  file = File.open(filename, "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:hobby], student[:height]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  #This message will be considered feedback when the user chose option 3 from the menu
  puts "Student list was saved/updated successfully!" 
end

def load_students(filename)
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort, hobby, height = line.chomp.split(',')
    access_list_of_students(name, cohort, hobby, height)
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil? 
    filename = "students.csv"# loads students.csv by default if the user doesn't provide a file name"
  end
  if File.exists?(filename) # if it exists
    load_students(filename)
    #This message will be considered feedback when the user chose option 4 from the menu
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

try_load_students
interactive_menu

	

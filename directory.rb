#let's put all students into an array
def input_students
  puts "Please enter the name, cohort(month), hobby and height(cm) for each student"
  puts "To finish, just hit return twice"
  months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"] 
  # create an empty array
  students = []
  # get the first name
  puts "Name: "
  name =  STDIN.gets.delete("\n").capitalize
  puts "Cohort: "
  cohort =  STDIN.gets.delete("\n").capitalize
  while !months.include?(cohort) && !name.empty?
    puts "Please introduce a valid cohort: "
    cohort =  STDIN.gets.delete("\n").capitalize
  end
  puts "Hobby: "
  hobby =  STDIN.gets.delete("\n")
  puts "Height: "
  height =  STDIN.gets.delete("\n")
  # while the name is not empty, repeat this code
  while !name.empty? && !hobby.empty? && !height.empty? && !cohort.empty? do
    # add the student hash to the array
    students << {name: name, hobby: hobby, height: height, cohort: cohort.to_sym}
    if students.count == 1
      puts "Now we have 1 student".center(50,"  ***  ")
    else
      puts "Now we have #{students.count} students"
    end
    # get another name from the user
    puts "Name: "
    name =  STDIN.gets.delete("\n").capitalize
    puts "Cohort: "
    cohort =  STDIN.gets.delete("\n").capitalize
    while !months.include?(cohort) && !name.empty?
      puts "Please introduce a valid cohort: "
      cohort =  STDIN.gets.delete("\n").capitalize
    end
    puts "Hobby: "
    hobby =  STDIN.gets.delete("\n")
    puts "Height: "
    height =  STDIN.gets.delete("\n")
  end
  # return the array of students
  students
end
	
def print_header
  puts "The students of Villains Academy".center(50,"  ***  ")
  puts "-------------".center(50,"  ***  ")
end

def print(students)
  if students.count > 0
  students.group_by{|student| student[:cohort]}.map do |month, students|
    string = ''
    puts "#{month}".center(50,"--")
    students.map{|student| puts "#{student[:name]}".center(50,"       ")}
  end
end
  
end

def print_footer(names)
  if names.count == 1
    puts "Now we have 1 student".center(50,"  ***  ")
  else 
  puts "Overall, we have #{names.count} great students".center(50,"  ***  ")
  end
end

def input_first_letter
  puts ""
  puts "Insert a letter to select the students whose name begins with that specific letter: "
  letter = gets.chomp.upcase
end

def print_with_letter(students, letter)
  students.each_with_index do |student, index|
    if student[:name][0] == letter
    puts "#{index+1}.#{student[:name]} (#{student[:cohort]} cohort)"
    end 
  end
end

def print_less_than_twelve_char_names(students)
  puts""
  puts "The students whose name is shorter than 12 characters are: "
  students.each_with_index do |student, index|
    if student[:name].length < 12
    puts "#{index+1}.#{student[:name]} (#{student[:cohort]} cohort)"
    end 
  end
end

def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 because we'll be adding more items
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
  end
end
  

#nothing happens until we call the methods
interactive_menu
#letter = input_first_letter
#print_with_letter(students, letter)
#print_less_than_twelve_char_names(students)
	

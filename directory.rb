#let's put all students into an array
def input_students
  puts "Please enter the name, cohort(month), hobby and height(cm) for each student"
  puts "To finish, just hit return twice"
  months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"] 
  # create an empty array
  students = []
  # get the first name
  puts "Name: "
  name = gets.chomp.capitalize
  puts "Cohort: "
  cohort = gets.chomp.capitalize
  while !months.include?(cohort) && !name.empty?
    puts "Please introduce a valid cohort: "
    cohort = gets.chomp.capitalize
  end
  puts "Hobby: "
  hobby = gets.chomp
  puts "Height: "
  height = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? && !hobby.empty? && !height.empty? && !cohort.empty? do
    # add the student hash to the array
    students << {name: name, hobby: hobby, height: height, cohort: cohort.to_sym}
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Name: "
    name = gets.chomp.capitalize
    puts "Cohort: "
    cohort = gets.chomp.capitalize
    while !months.include?(cohort) && !name.empty?
      puts "Please introduce a valid cohort: "
      cohort = gets.chomp.capitalize
    end
    puts "Hobby: "
    hobby = gets.chomp
    puts "Height: "
    height = gets.chomp
  end
  # return the array of students
  students
end
	
def print_header
  puts "The students of Villains Academy".center(50,"  ***  ")
  puts "-------------".center(50,"  ***  ")
end

def print(students)
  string = ''
  students.group_by{|student| student[:cohort]}.map do |month, students|
    string += "\n#{month}: "
    students.map{|student| string += "#{student[:name]}, "}
  end
  puts string
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(50,"  ***  ")
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
  

#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
letter = input_first_letter
print_with_letter(students, letter)
print_less_than_twelve_char_names(students)
	

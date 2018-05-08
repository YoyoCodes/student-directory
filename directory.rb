#let's put all students into an array
def input_students
  puts "Please enter the name, hobby and height(cm) for each student"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  puts "Name: "
  name = gets.chomp.capitalize
  puts "Hobby: "
  hobby = gets.chomp
  puts "Height: "
  height = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? && !hobby.empty? && !height.empty? do
    # add the student hash to the array
    students << {name: name, hobby: hobby, height: height, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Name: "
    name = gets.chomp.capitalize
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
  student_index = 0
  while student_index < students.length do
    puts "#{student_index+1}.#{students[student_index][:name]} - #{students[student_index][:cohort]} cohort".center(50,"      ")
    student_index += 1
  end
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
	

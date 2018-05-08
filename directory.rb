#let's put all students into an array
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp.capitalize
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp.capitalize
  end
  # return the array of students
  students
end
	
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index+1}.#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def input_first_letter
  puts "Insert a letter to select the students whose name begins with that specific letter: "
  letter = gets.chomp.upcase
end

def print_with_letter(students, letter)
  students.each_with_index do |student, index|
    if student[:name][0][0][0] == letter
    puts "#{index+1}.#{student[:name]} (#{student[:cohort]} cohort)"
    end 
  end
end
  

#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
puts=""
letter = input_first_letter
print_with_letter(students, letter)
	

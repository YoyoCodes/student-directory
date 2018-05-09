@students = [] # an empty array accessible to all methods

#let's put all students into an array
def input_students
  puts "Please enter the name, cohort (month), hobby and height (in cm) for each student"
  puts "To finish, just hit return twice"
  months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"] 

  # get the first name
  puts "Name: "
  name =  STDIN.gets.delete("\n").capitalize
  puts "Cohort: "
  cohort =  STDIN.gets.delete("\n").capitalize
  while !months.include?(cohort) && !name.empty?
    puts "Please introduce a valid cohort (name of a month): "
    cohort =  STDIN.gets.delete("\n").capitalize
  end
  puts "Hobby: "
  hobby =  STDIN.gets.delete("\n")
  puts "Height: "
  height =  STDIN.gets.delete("\n")
  # while the name is not empty, repeat this code
  while !name.empty? do
    if hobby.empty?
      hobby = "Collecting Steve Jobs memorabilia"
    end

    if height.empty?
      height = "13.14"
    end 
      
    # add the student hash to the array
    @students << {name: name, hobby: hobby, height: height, cohort: cohort.to_sym}
    if @students.count == 1
      puts "Now we have 1 student"
    else
      puts "Now we have #{@students.count} students"
    end

    # get another name/cohort/hobby/height from the user
    puts "Name: "
    name =  STDIN.gets.delete("\n").capitalize
    if !name.empty?
      puts "Cohort: "
      cohort =  STDIN.gets.delete("\n").capitalize
      while !months.include?(cohort) && !name.empty?
        puts "Please introduce a valid cohort (name of a month): "
        cohort =  STDIN.gets.delete("\n").capitalize
      end
      puts "Hobby: "
      hobby =  STDIN.gets.delete("\n")
      puts "Height: "
      height =  STDIN.gets.delete("\n")
      end
    end

  # return the array of students
  @students
end
	
def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
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
  puts "\nOverall, we have #{@students.count} great students".center(50)
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit" # 9 because we'll be adding more items  
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end


#nothing happens until we call the methods
interactive_menu

	

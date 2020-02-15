
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create empty array
  name = gets.chomp
  #while name isn't empty do
  while !name.empty? do
    #add student hash to array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    #get another name from user
    name = gets.chomp
  end
  #return array of students 
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students
  @students.each do |students|
    puts "#{students[:name]}" + " (#{students[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students 
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  @students = []
  loop do
    print_menu
    process(gets.chomp)
  end
end	

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

interactive_menu
# students = input_students
# print_header
# print(students)
# print_footer(students)
# finally, we print the total number of students

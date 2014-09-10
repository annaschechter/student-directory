@students = []

def interactive_menu
  loop do
    try_load_students
    print_menu
    process(STDIN.gets.chomp)
  end
end


def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end


def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else 
      puts "I don't know what you mean, try again"
  end
end


def show_students
  printing_header
  print_student_list
  printing_footer
end


def input_students
  get_the_name
  #while the name is not empty, repeat this code
  while !@name.empty?
  get_the_cohort
  get_the_country
  get_the_hobby
  add_to_the_array
  get_another_name
  end
  @students
end

def get_the_name
  print "Please enter the name of the student\n".center(50)
  @name = STDIN.gets.chomp
end

def get_the_cohort
  print "Please enter the cohort of the student\n".center(50)
  @cohort = STDIN.gets.chomp
  @months = [:september, :october, :november, :december, :january, :february, :march, :april, :may, :june, :july, :august]
  while !@months.include?(@cohort.downcase.to_sym)
    print "Cohort does not exist, please check the spelling\n".center(50)
    @cohort = STDIN.gets.chomp
  end
end

def get_the_country    
  print "Please enter the student's country of birth\n".center(50)
  @country = STDIN.gets.chomp
  while @country.empty?
    print "Please enter the student's country of birth\n".center(50)
    @country = STDIN.gets.chomp
  end
end

def get_the_hobby
  print "Please enter the student's hobby\n".center(50)
  @hobby = STDIN.gets.chomp
  while @hobby.empty? 
    print "Please enter the student's hobby\n".center(50)
    @hobby = STDIN.gets.chomp
  end
end

def add_to_the_array
  @students << {:name => @name.capitalize, :cohort => @cohort.downcase.to_sym, :country => @country, :hobby => @hobby}
  if @students.length == 1
    print "Now we have 1 student\n"
  else
    print "Now we have #{@students.length} students\n"
  end
end
 
def get_another_name
  print "Please enter the name of the next student\n".center(50)
  print "To finish, just hit return\n".center(50)
  @name = STDIN.gets.chomp
end


def printing_header
  print "The students at Makers Academy\n".center(50)
  print "----------------------------\n"
end


def print_student_list
  @months = [:september, :october, :november, :december, :january, :february, :march, :april, :may, :june, :july, :august]
  num = 0
  while num < 12
    x = @students.select{|student| student[:cohort] == @months[num]}
    if !x.empty?
    print "#{@months[num].capitalize}:\n"
    x.each {|student| print "#{student[:name].capitalize} is from #{student[:country].capitalize} and #{student[:name].capitalize}'s favourite hobby is #{student[:hobby]}\n"}
    end
    num += 1
  end 
end


def printing_footer
  @students.each 
  if @students.length == 1 
    print "Overall, we have 1 great student\n" 
  else
    print "Overall, we have #{@students.length} great students\n"
  end
end


def save_students
  #open the file for writting
  file = File.open("students.cvs", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:country], student[:hobby]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.cvs")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    words = line.chomp.split(",")
    name = words[0]
    cohort = words[1]
    country = words[2]
    hobby = words[3]
    @students << {:name => name, :cohort => cohort.downcase.to_sym, :country => country, :hobby => hobby}
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.length} from #{filename}"
  else #if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

#nothing happens until we call the method
interactive_menu
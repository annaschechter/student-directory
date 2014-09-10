def interactive_menu
  students = []
  # 4. repeat from step 1
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. input the students"
    puts "2. show the students"
    puts "9. exit"
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
      when "1"
        # input the students
        students = input_students
      when "2"
        # show the students
        printing_header
        printing(students)
        printing_footer(students)
      when "9"
        exit # this will cause the program to terminate
      else 
        puts "I don't know what you meant, try again"
    end
  end
end

  
def input_students
  print "Please enter the name of the student\n".center(50)
  #create am empty array
  students = []
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty?
    print "Please enter the cohort of the student\n".center(50)
    #get the cohort
    cohort = gets.chomp
    months = [:september, :october, :november, :december, :january, :february, :march, :april, :may, :june, :july, :august]
    while !months.include?(cohort.downcase.to_sym)
      print "Cohort does not exist, please check the spelling\n".center(50)
      cohort = gets.chomp
    end
    print "Please enter the student's country of birth\n".center(50)
    #get the country
    country = gets.chomp
    while country.empty?
      print "Please enter the student's country of birth\n".center(50)
      #get the country
      country = gets.chomp
    end
    print "Please enter the student's hobby\n".center(50)
    #get the hobby
    hobby = gets.chomp
    while hobby.empty? 
      print "Please enter the student's hobby\n".center(50)
      #get the hobby
      hobby = gets.chomp
    end
    #add the student hash to the array
    students << {:name => name.capitalize, :cohort => cohort.downcase.to_sym, :country => country, :hobby => hobby}
    if students.length == 1
      print "Now we have 1 student\n"
    else
      print "Now we have #{students.length} students\n"
    end
    # get another name from the user
    print "Please enter the name of the next student\n".center(50)
    print "To finish, just hit return\n".center(50)
    name = gets.chomp
  end
  # return the array of students
  students  
end


def printing_header
  print "The students at Makers Academy\n".center(50)
  print "----------------------------\n"
end


def printing(names)
  months = [:september, :october, :november, :december, :january, :february, :march, :april, :may, :june, :july, :august]
  num = 0
  while num < months.length
    x = names.select{|student| student[:cohort] == months[num]}
    if !x.empty?
    print "#{months[num].capitalize}:\n"
    x.each {|student| print "#{student[:name].capitalize} is from #{student[:country].capitalize} and their favoutite hobby is #{student[:hobby]}\n"}
    end
    num += 1
  end 
end


def printing_footer(names)
  names.each 
  if names.length == 1 
    print "Overall, we have 1 great student\n" 
  else
    print "Overall, we have #{names.length} great students\n"
  end
end

#nothing happens until we call the method
interactive_menu
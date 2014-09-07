# let's put all students into an array
students = [
"Nina Herring",
"Sam Becker",
"Sarah Lester",
"Mario Young",
"Ayse Barch",
"Linda Cooper",
"Deborah Jordan",
"Lucas Scott",
"Andrew Oates"
]

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-----------  "
end

def print(names)
  names.each {|name| puts name}
end

def print_footer(names)
  puts "Overall, we have #{names.length} great students"
end
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
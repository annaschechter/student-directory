students = [
{:name => "Nina Herring", :cohort => :september},
{:name => "Sam Becker", :cohort => :september},
{:name => "Sarah Lester", :cohort => :september},
{:name => "Mario Young", :cohort => :september},
{:name => "Ayse Barch", :cohort => :september},
{:name => "Linda Cooper", :cohort => :september},
{:name => "Deborah Jordan", :cohort => :september},
{:name => "Lucas Scott", :cohort => :september},
{:name => "Andrew Oates", :cohort => :september}
]

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-----------  "
end

def print(names)
  names.each {|student| puts "#{student[:name]} (#{student[:cohort]} cohort)"}
end

def print_footer(names)
 names.each 
  puts "Overall, we have #{names.length} great students"
end
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
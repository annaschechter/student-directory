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
# and then print them
puts "The students of my cohort at Makers Academy"
puts "-----------  "
students.each {|student| puts student}
#finally, we print the total
print "Overall, we have #{students.length} great students"
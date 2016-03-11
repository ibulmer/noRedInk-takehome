#read in our csv files
require 'csv'
questions = CSV.read('../csv/questions.csv')
students = CSV.read('../csv/usage.csv')

#strip of headers
questions.shift()
students = students.shift()

#prompt user for an integer. Will be number of test questions asked
number = nil
#make sure number is an integer
until number.is_a?(Fixnum) && number>0 do
  print "Please enter a number: "
  number = Integer(gets) rescue nil
end

#function to choose a random element in an array. used to choose a random question.
def randomElm(arr)
  return arr[rand(arr.length)]
  #expand on this to weight questions not seen and questions not answered more heavily
end

results = []
#naive solution. Loop through number of questions choosing random question and adding it to our results array.

for i in 1..number
  results.push randomElm(questions)[4]
end

puts results
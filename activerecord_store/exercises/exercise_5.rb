require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'

puts "Exercise 5"
puts "----------"

# Your code goes here ...
revenue = Store.sum(:annual_revenue)
puts "The total revenue of all stores is #{revenue}."
average_revenue = Store.average(:annual_revenue)
puts "The average annual revenue of all stores is #{average_revenue}"
over_million = Store.where("annual_revenue > ?", 1000000).count
puts "The number of stores making over a million is #{over_million}"

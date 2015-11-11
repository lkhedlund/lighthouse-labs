require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

# Your code goes here ...
@store1.employees.create(first_name: "Jim", last_name: "Tank", hourly_rate: 13)
@store1.employees.create(first_name: "Jerry", last_name: "Tal", hourly_rate: 12)
@store1.employees.create(first_name: "Jane", last_name: "Tango", hourly_rate: 15)
@store1.employees.create(first_name: "Jack", last_name: "Tanger", hourly_rate: 11)
@store2.employees.create(first_name: "Fred", last_name: "Lick", hourly_rate: 13)
@store2.employees.create(first_name: "Fry", last_name: "Lich", hourly_rate: 15)
@store2.employees.create(first_name: "Fran", last_name: "Cisco", hourly_rate: 16)
@store2.employees.create(first_name: "Frela", last_name: "Tillo", hourly_rate: 17)

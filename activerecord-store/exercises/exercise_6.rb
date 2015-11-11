require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

# Your code goes here ...
@store1.employees.create(first_name: "Jim", last_name: "Tank", hourly_rate: 40)
@store1.employees.create(first_name: "Jerry", last_name: "Tal", hourly_rate: 41)
@store1.employees.create(first_name: "Jane", last_name: "Tango", hourly_rate: 42)
@store1.employees.create(first_name: "Jack", last_name: "Tanger", hourly_rate: 43)
@store2.employees.create(first_name: "Fred", last_name: "Lick", hourly_rate: 50)
@store2.employees.create(first_name: "Fry", last_name: "Lich", hourly_rate: 51)
@store2.employees.create(first_name: "Fran", last_name: "Cisco", hourly_rate: 52)
@store2.employees.create(first_name: "Frela", last_name: "Tillo", hourly_rate: 53)
